console.log('loading ...');


var url = "http://127.0.0.1:5000/modal/questions.json";

var app = new Vue({
    el: '#app',
    data() {
        return {
            questions: {data:[]}
        }
    },
    mounted() {
        axios
            .get(url)
            .then(response => (this.questions = response.data))
    }
})