const appointment = require('../models/appointments');

function open(req,res){
    let new_appointments = new appointment({
        user_id: req.session.user_id,
        date: req.body.date,
        open: true
    });
    new_appointments.save(function(err, data){
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

function view_by_id(req, res){
    appointment.findById(req.body.appointment_id, function(err, data){
        if(err) res.send(err);
        else res.json(data);
    })
}

module.exports = {open, close, view_all, view_by_id}