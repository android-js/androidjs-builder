const mongoose = require('mongoose');
const users = require('../models/users');

function get_all_users(req, res){
    users.find({}, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    })
}

function insert(req, res){
    let user = new users({
        name:'test',
        email:'test@test.com',
        password:'test',
        record:{
            '2009':{}
        }
    });

    user.save(function(err, data){
        if(err) res.send(err);
        else res.json(data);
    })
}

module.exports = {
    insert:insert,
    get_all_users:get_all_users
}