const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');



const schema = mongoose.Schema;

const users = new schema({
    name:String,
    email: {type: String, unique: true, required: true},
    password:{ type: String, required: true },
    record: Map
});

users.plugin(uniqueValidator);

module.exports = new mongoose.model('users', users);