const user_controller = require('../controllers/users');

module.exports = function(app){
    app.route('/newuser')
    .get(function(req, res){
        user_controller.insert(req, res);
    });

    app.route('/showusers').get(function(req,res){
        user_controller.get_all_users(req,res);
    });
}