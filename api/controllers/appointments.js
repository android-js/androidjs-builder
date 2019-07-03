const appointment = require('../models/appointments');

function open(req,res){
    let new_appointment = new appointment({
        user_id: req.session.user_id,
        date: req.body.date,
        open: true
    });
    new_appointment.save(function(err, data){
        if(err) res.send(err);
        else res.json(data);
    })
}

function close(req, res){
    appointment.findOneAndUpdate({_id:req.body.appointment_id}, {open:false}, {upsert:true} ,function(err,data){
        if(err) res.send(err);
        else res.json(data);
    })
}

function view_all(req, res){
    appointment.find({}, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    })
}

function view_all_open(req,res){
    appointment.find({open:true}, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    })
}

function view_all_closed(req, res){
    appointment.find({open:false}, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    })
}

function view_by_id(req, res){
    appointment.findById(req.body.appointment_id, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    })
}

module.exports = {open, close, view_all, view_by_id, view_all_open, view_all_closed}