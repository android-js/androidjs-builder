const mongoose = require('mongoose');

function connect(){
    mongoose.connect('mongodb://192.168.43.234:27017/virtual_ca', {useNewUrlParser: true}).then(function(){
        console.log('Connection Done');
    }, function(err){
        throw err;
    });
}

module.exports = {
    connect:connect
}