const mongoose = require('mongoose');

const schema = mongoose.Schema;

const appointments = new schema({
    user_id: String,
    date: String,
    open: Boolean
});

module.exports = new mongoose.model('appointments', appointments);