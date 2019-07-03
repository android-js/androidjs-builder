const mongoose = require('mongoose');
const users = require('../models/users');

function get_all_users(req, res) {
    // console.log(users);
    users.find({}, function (err, data) {
        if (err) res.send(err);
        else res.json(data);
    });
}

function get_user_by_id(req, res, user_id) {
    users.findById(user_id, function (err, data) {
        if (err) res.send(err);
        else res.json(data);
    });
}

function update_user_record_by_id(req, res, user_data) {
    users.findById(user_data.id, function (err, data) {
        if (err) res.send(err);
        else {
            let new_data = data.record;
            if (!new_data.get(user_data.year)) {
                // console.log('hello');
                new_data.set(user_data.year, {})
                // new_data[user_data.year] = {"asfs":{}}
                // console.log(new_data);
            }
            // console.log(user_data.year, new_data[user_data.year])
            new_data.get(user_data.year)[user_data.month] = user_data.record;
            // new_data[user_data.year][user_data.month] =  user_data.record;

            // console.log(new_data);
            users.findOneAndUpdate({_id: user_data.id}, { record: new_data}, {upsert: true }, function (err, data) {
                if (err) res.send(err);
                else res.json(data);
            })
        }
    });
}

function clean_user_record_by_id(req, res, user_id) {
    users.findOneAndUpdate({_id: user_id}, {record: {}}, {upsert: true}, function (err, data) {
        if (err) res.send(err);
        else res.json(data.record);
    })
}

function get_user_record_by_id(req, res, user_id, year, month) {
    users.findById({_id: user_id}, function (err, data) {
        if (err) res.send(err);
        else {
            if (data && (data.record.get(year)) && (data.record.get(year)[month] !== undefined)) {
                res.json(data.record.get(year)[month]);
            } else {
                res.json({error: true, msg: "record not found"});
            }
        }
    });

    // res.json({error:true, msg:"'user.get_by_id' not implemented yet"});
    // console.log("'user.get_by_id' not implemented yet");
}

function get_user_by_email_and_password(req, res, user_email, password) {
    users.find({
        email: user_email,
        password: password
    }, function (err, data) {
        if (err) res.send(err);
        else {
            // console.log(data);
            if (data[0]) {
                req.session.user_id = data[0]._id;
                req.session.name = data[0].name;
                req.session.email = data[0].email;
                req.session.category = data[0].category;
                req.session.taxpayer = data[0].taxpayer;
                console.log(req.session.user_id);
                res.json({
                    error: false,
                    msg: "login success",
                    user_id: data[0]._id,
                    name: data[0].name,
                    email: data[0].email,
                    category: data[0].category,
                    taxpayer: data[0].taxpayer
                });
                // console.log(data[0]._id, req.session.user_id);
            } else {
                res.send({
                    error: true,
                    msg: "invalid details"
                });
            }
        }
    });
}

function insert(req, res, user) {
    console.log(user)
    let new_user = new users({
        name: user.name,
        email: user.email,
        password: user.password,
        mobile: user.mobile,
        category: user.category,
        taxpayer: user.taxpayer,
        record: {
            '2019':{}
        }
    });

    new_user.save(function (err, data) {
        if (err) res.send(err);
        else res.json(data);
    })
}

function delete_id(req, res, uid) {
    users.remove({
        _id: uid
    }, function (err) {
        if (err) res.send(err);
        else res.send({
            success: true
        })
    });
}

function get_net_taxable_income(req, res, date) {
    let year = date.split('-')[0];
    let month = parseInt(date.split('-')[1]);
    console.log(month)
    console.log(req.session.user_id);
    users.find({
        _id: req.session.user_id
    }, function (err, data) {
        if (err) res.send(err);
        else {
            data = data[0];
            console.log(data);
            let net_taxable_income = 0;
            if (month >= 4) {
                console.log(year);
                for (let i = month - 1; i >= 4; i--) {
                    if (data.record.get(year) && data.record.get(year)[(i > 9) ? i.toString() : "0" + i]) {
                        net_taxable_income += parseInt(data.record.get(year)[(i > 9) ? i.toString() : "0" + i]['id_nti1']);
                    } else break;
                }
            } else {
                for (let i = month - 1; i > 0; i--) {
                    if (data.record.get(year) && data.record.get(year)[(i > 9) ? i.toString() : "0" + i]) {
                        net_taxable_income += parseInt(data.record.get(year)[(i > 9) ? i.toString() : "0" + i]['id_nti1']);
                    } else break;
                }
                for (let i = 12; i >= 4; i--) {
                    let new_year = (parseInt(year) + 1).toString();
                    if (data.record.get(year) && data.record.get(new_year)[(i > 9) ? i.toString() : "0" + i]) {
                        net_taxable_income += parseInt(data.record.get(year)[(i > 9) ? i.toString() : "0" + i]['id_nti1']);
                    } else break;
                }
            }
            res.json({
                net_taxable_income
            });
        }
    });

}

function get_record_question_id(req,res){
    let month = parseInt(req.query.date.split('-')[1]);
    let year = req.query.date.split('-')[0];
    let labels = [], data = [];
    let question_id = req.query.question_id;

    console.log(req.session.user_id);
    users.find({_id: req.session.user_id}, function(err, user_data){
        if(err) res.send(err);
        else{
            // console.log(user_data.record, year);
            user_data = user_data[0];
            if(user_data.record.get(year)){
                for(let i = 4; i <= 12; i++){
                    let current_month = '';
                    if(i < 10) current_month = '0' + i.toString();
                    else current_month = i.toString();
                    if(user_data.record.get(year)[current_month]){
                        labels.push(i);
                        data.push(user_data.record.get(year)[current_month][question_id]);
                    }
                }
                for(let i = 1; i < 4; i++){
                    let current_month = '';
                    if(i < 10) current_month = '0' + i.toString();
                    else current_month = i.toString();
                    if(user_data.record.get(year)[current_month]){
                        labels.push(i);
                        data.push(user_data.record.get(year)[current_month][question_id]);
                    }
                }
                res.json({error:false, labels, data});
            }else res.json({error:true, msg:'record not found..'});
        }
    })
}

function current_login_user(req, res) {
    if (req.session.user_id) res.json({
        error: false,
        user_id: req.session.user_id
    });
    else res.json({
        error: true,
        msg: "no login user found.."
    });
}

module.exports = {
    insert: insert,
    get_all_users: get_all_users,
    get_user_by_id: get_user_by_id,
    get_user_by_email_and_password,
    delete_id,
    update_user_record_by_id,
    get_user_record_by_id,
    clean_user_record_by_id,
    get_net_taxable_income,
    current_login_user,
    get_record_question_id
}