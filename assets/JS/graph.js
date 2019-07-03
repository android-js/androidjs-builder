$(function(){
    console.log(document);
    let individual = document.getElementById('individual_graph').getContext('2d');
    console.log(individual);
    window.individual_chart = new Chart(individual, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'Augest', 'September', 'October', 'November', 'December'],
            datasets: [{
                label: 'My First dataset',
                fill:false,
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: []
            }]
        },

        // Configuration options go here
        options: {}
    });

    let all_graph = document.getElementById('all_graph').getContext('2d');
    window.all_chart = new Chart(all_graph, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'Augest', 'September', 'October', 'November', 'December'],
            datasets: []
        },

        // Configuration options go here
        options: {}
    });

    let compare_graph = document.getElementById('compare_graph').getContext('2d');
    window.compare_chart = new Chart(compare_graph, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'Augest', 'September', 'October', 'November', 'December'],
            datasets: []
        },

        // Configuration options go here
        options: {}
    });
});

let mp =  ['', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'Augest', 'September', 'October', 'November', 'December'];
function updateData(chart, labels, data) {
    // if(chart == 'individual_graph') chart = individual_graph;
    console.log(chart, labels, data);
    chart.data.labels = map_months(labels);
    chart.data.datasets[0].data = data;
    chart.update();
}

function map_months(list){
    let ans = [];
    for(let i=0; i<list.length; i++){
        ans.push(mp[list[i]]);
    }
    return ans;
}

function fillGraph(chart, data) {
    chart.data.datasets = data;
    chart.update();
}

function setLabels(chart, labels) {
    console.log(chart);
    chart.data.labels = labels;
    chart.update();
}



function clearGraph(chart) {
    chart.data.datasets = [];
    chart.update();
}

// function()