const mongoose = require('mongoose');
const users = require('../models/users');

function get_all_users(req, res){
    users.find({}, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    });
}

function get_user_by_id(res, user_id){
    users.findById(user_id, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    });
}

function get_user_by_email(res, user_email){
    users.find( {email: user_email}, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    });
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

function delete_id(res, uid){
    users.remove({_id: uid}, function(err){
        if(err) res.send(err);
        else res.send({success: true})
    });
}

module.exports = {
    insert: insert,
    get_all_users: get_all_users,
    get_user_by_id: get_user_by_id,
    get_user_by_email,
    delete_id
}