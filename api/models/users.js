const mongoose = require('mongoose');

const schema = mongoose.Schema;

const users = new schema({
    name:String,
    email:String,
    password:String,
    record:Map
});

module.exports = new mongoose.model('users', users);