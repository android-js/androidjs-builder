let app = new Vue({
    el: "#app",

    data() {
        return {
            name: "",
            userid: "",
            category: "",
            taxpayer: "",
            date: "2019-06-15",
            tax_rate: {},

            Status: ['bg-primary', 'bg-secondary', 'bg-success', 'bg-danger'],
            currentStatus: 0,
            months: 0,
            temp: {},


            questions_url: "/static/data/faltu.json",
            user_record_url: "/api/get-record-id/",
            getCurrentUserInfoURL: "/api/current-login-user/",
            updateUserRecordUrl: "/api/update-record-id/",

            selected_form: 0,
            net_taxable_income: 0,
            QUESTIONS: {},
            Q_map:{},
            checked: {},
            values: {},
            FORMS: [],
            OUTPUTS: [],
            Q_list: [
                // {
                //     text: "Income",
                //     alert: "10",
                //     alert_status: "badge-primary"
                // }
            ],
        }
    },

    methods: {
        updateCompareGraph(){
            console.log(this.checked, "Hello");
            let ggg = function(name, data) {
                let color = `rgb(${Math.random()*250 + 5}, ${Math.random()*250 + 5}, ${Math.random()*250 + 5})`;
                return {
                    label: name,
                    fill:false,
                    backgroundColor: color,
                    borderColor: color,
                    data
                };
            };

            clearGraph(window.compare_chart);
            let ans = [], labels;
            for(let i in this.checked) {
                if(this.checked[i]){
                    console.log(i, this.checked[i], "world");
                    let final_id = `id_${i}`;
                    console.log(final_id);
                    let name = this.Q_map[final_id].question;
                    $.ajax({
                        url:'/api/query-id',
                        async: false,
                        data: {date:this.date, question_id:final_id},
                        success: function(response){
                            console.warn('Response',  response);
                            if(!response.error){
                                console.log(name);
                                ans.push(new ggg(name, response.data));
                                labels = response.labels;
                            }else{
                                console.log(response);
                                clearGraph(window.compare_chart);
                            }
                        }
                    });
                }
            }
            console.log(labels, ans);
            setLabels(window.compare_chart, labels);
            fillGraph(window.compare_chart, ans);
        },

        updateFormGraph() {
            console.log("form changed")

            let ggg = function(name, data) {
                let color = `rgb(${Math.random()*250 + 5}, ${Math.random()*250 + 5}, ${Math.random()*250 + 5})`;
                return {
                    label: name,
                    fill:false,
                    backgroundColor: color,
                    borderColor: color,
                    data
                };
            };

            clearGraph(window.all_chart);

            let ans = [], labels;
            for(i in this.FORMS[this.selected_form]){
                let final_id = `id_${this.FORMS[this.selected_form][i].id}`;
                console.log(final_id);
                let name = this.FORMS[this.selected_form][i].question;
                $.ajax({
                    url:'/api/query-id',
                    async: false,
                    data: {date:this.date, question_id:final_id},
                    success: function(response){
                        if(!response.error){    
                            console.log(name);
                            ans.push(new ggg(name, response.data));
                            console.log('response - ', response);
                            if(i == 0) labels = response.labels;
                        }else{
                            console.log(response);
                            clearGraph(window.all_chart);
                        }
                    }
                });
            }
            setLabels(window.all_chart, map_months(labels));
            fillGraph(window.all_chart, ans);
            console.log(ans);
        },

        updateGraph(id){
            let final_id = `id_${id}`;
            $.ajax({
                url:'/api/query-id',
                data: {date:this.date, question_id:final_id},
                success: function(response){
                    if(!response.error){
                        updateData(window.individual_chart, response.labels, response.data);
                    }else{
                        console.log(response);
                        updateData(window.individual_chart, [], []);
                    }
                }
            });
        },

        predict() {
            this.months = (12 - (parseInt(this.date.split('-')[1]) - 4));
            let ans = this.months * parseInt(window['id_nti1']);
            ans += this.net_taxable_income;
            ans = applyTax(ans, this.tax_rate);
            console.log([this.net_taxable_income, this.months, ans, window['id_nti1']]);
            return ans;
        },

        calculate_tax(_val) {
            console.log(_val);
            let ans = applyTax(_val, this.tax_rate);
            if (ans > 0) this.currentStatus = 3;
            else this.currentStatus = 2;

            return ans;
        },

        sendAjaxRequest(data, url) {
            $.ajax(
                {
                    type: "POST",
                    url: url,
                    data: data,
                    success: (data) => {
                        console.log(data);
                    },
                    error: (err) => {
                        console.log(err);
                    }
                }
            );
        },

        save() {
            let context = {
                record: {...this.values, ...this.temp},
                id: this.userid,
                year: this.date
            };
            console.log('Saving...', context);
            console.log(this.temp);
            this.sendAjaxRequest(context, this.updateUserRecordUrl);
        },

        getUserRecordUrl() {
            return `${this.user_record_url}?date=${this.date}&id=${this.userid}`;
        },
        reloadValues() {
            axios.get(this.getUserRecordUrl()).then(response => {
                // console.log(response.data);

                if (response.data["error"] != true) {
                    this.values = response.data;
                } else {
                    
                    for (i in this.values) {
                        this.values[i] = 0;
                    }
                }

            });
        },

        evelFormula(question, flag=false) {
            for (i in this.values) {
                this.values[i] = parseInt(this.values[i]);
            }
            console.log(question);

            let ans ;
            if(flag){
                ans = eval(question.eval) || 0;
            }else{
                ans = eval(question.formula) || 0;
                this.temp[`id_${question.id}`] = ans;
            }

            window[`id_${question.id}`] = ans;

            // this.values[`id_${question.id}`] = ans;
            
            console.log(ans);
            return ans;
        },

        getCurrentTotal() {
            return window['id_nti1'];
        }
    },
    created() {


        axios.get(this.getCurrentUserInfoURL).then(response => {
            this.userid = response.data.user_id;
            this.name = response.data.name;
            this.email = response.data.email;
            this.category = response.data.category;
            this.taxpayer = response.data.taxpayer;

            $.get('/api/get-net-taxable-income/', {date: this.date}, (data, status) => {
                this.net_taxable_income = data.net_taxable_income;
            });

        }).then(() => {
            axios.get(`/static/data/${this.taxpayer}.json`).then(response => {
                this.tax_rate = response.data.tax_rate;
                console.log(this.tax_rate);
            });
        });


        axios.get(this.questions_url).then(response => {
            this.QUESTIONS = response.data.data;
            for (i in this.QUESTIONS) {
                this.Q_list.push({
                    text: this.QUESTIONS[i].question,
                    alert: this.QUESTIONS[i].alert || "0",
                    alert_status: this.QUESTIONS[i].alert_status || 'badge-primary'
                });
                this.FORMS.push(this.QUESTIONS[i].children);
                for (j in this.QUESTIONS[i].children) {
                    this.values[`id_${this.QUESTIONS[i].children[j].id}`] = 0;
                    this.Q_map[`id_${this.QUESTIONS[i].children[j].id}`] = this.QUESTIONS[i].children[j]; 
                    if (this.QUESTIONS[i].children[j].type === "output") {

                        this.QUESTIONS[i].children[j]._formula = this.QUESTIONS[i].children[j].formula;

                        this.QUESTIONS[i].children[j].formula = this.QUESTIONS[i].children[j].formula.replace(/#/g, 'this.values.id_');
                        this.QUESTIONS[i].children[j].formula = this.QUESTIONS[i].children[j].formula.replace(/@/g, "this.");
                        
                        this.OUTPUTS.push(this.QUESTIONS[i].children[j]);
                    }
                    if(this.QUESTIONS[i].children[j]['eval']){
                        this.QUESTIONS[i].children[j].eval = this.QUESTIONS[i].children[j].eval.replace(/#/g, 'this.values.id_');
                        this.QUESTIONS[i].children[j].eval = this.QUESTIONS[i].children[j].eval.replace(/@/g, "this.");
                    }
                    // this.all.push(this.QUESTIONS[i].children[j]);
                }
            }
        }).then(() => {
            axios.get(this.getUserRecordUrl()).then(response => {
                // console.log(response.data);
                if(!response.data.error)
                this.values = response.data;
            });
            console.log("done");
        });
    }
});


function applyTax(_val, tax_rate) {

    let val = parseInt(_val);
    if (val < 1) {
        // this.currentStatus = 2;
        return 0;
    }
    else {
        // this.currentStatus = 3;
        let rate = "";

        for (i in tax_rate) {
            let l = tax_rate[i].l;
            let r = tax_rate[i].r;

            if (val >= l && val <= r) {
                // console.log(this.tax_rate[i]);
                rate = tax_rate[i].val;
                break;
            }
            if (val >= l && r == -1) {
                rate = tax_rate[i].val;
                break;
            }
        }
        let ans = eval(rate);
        console.log(val, rate, ans);
        return ans;
    }
}
