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
            if(new_data[user_data.year] == undefined){
                console.log('hello');
                new_data.set(user_data.year, new Map())
                // new_data[user_data.year] = {"asfs":{}}
                console.log(new_data);
            }
            // console.log(user_data.year, new_data[user_data.year])
            new_data.get(user_data.year).set(user_data.month, user_data.record);
            // new_data[user_data.year][user_data.month] =  user_data.record;

            console.log(new_data);
            users.findOneAndUpdate({_id:user_data.id}, {record: new_data}, {upsert:true}, function(err, data){
                if(err) res.send(err);
                else res.json(data);
            })
        }
    });
}

function clean_user_record_by_id(req, res, user_id){
    users.findOneAndUpdate({_id:user_id}, {record:{}}, {upsert:true} ,function(err, data){
        if(err) res.send(err);
        else res.json(data.record);
    })
}

function get_user_record_by_id(req, res, user_id, year, month){
    users.findById({_id:user_id}, function(err, data){
        if(err) res.send(err);
        else{
            if(data.record.get(year) && data.record.get(year).get(month)){
                res.json(data.record.get(year).get(month));
            }else{
                res.json({error:true, msg:"record not found"});
            }
        }
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
    get_user_record_by_id,
    clean_user_record_by_id
}