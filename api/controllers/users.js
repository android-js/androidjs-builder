const mongoose = require('mongoose');
const users = require('../models/users');

function get_all_users(req, res){
    users.find({}, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    });
}

function get_user_by_id(req, res, user_id){
    users.findById(user_id, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    });
}

function update_user_record_by_id(req, res, user_data){
    users.findById(user_data.id, function(err, data){
        if(err) res.send(err);
        else {
            let new_data = data.record;
            new_data[user_data.year] = user_data.record;
            users.findOneAndUpdate(user_data.id, {record: new_data}, {upsert:true}, function(err, data){
                if(err) res.send(err);
                else res.json(data);
            })
        }
    });
}

function get_user_record_by_id(req, res, user_id){
    users.findById(user_id, function(err, data){
        if(err) res.send(err);
        else res.jsong(data.record);
    })
}

function get_user_by_email(req, res, user_email){
    users.find( {email: user_email}, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    });
}

function insert(req, res, user){
    console.log(user)
    let new_user = new users({
        name:user.name,
        email:user.email,
        password:user.password,
        record:{
            '2009':{}
        }
    });

    new_user.save(function(err, data){
        if(err) res.send(err);
        else res.json(data);
    })
}

function delete_id(req, res, uid){
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
    delete_id,
    update_user_record_by_id,
    get_user_record_by_id
}