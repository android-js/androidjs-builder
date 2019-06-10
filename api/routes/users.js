const user_controller = require('../controllers/users');

module.exports = function(app){
    app.route('/newuser').get(function(req, res){
        let user = {}
        user.name = req.query.name;
        user.email = req.query.email;
        user.password = req.query.password;

        user_controller.insert(req, res, user);
    });
    app.route('/delete-id/:uid').get(function(req, res){
        user_controller.delete_id(res, req.params.uid);
    });

    app.route('/showusers').get(function(req,res){
        user_controller.get_all_users(req,res);
    });

    app.route('/getuser-id/:uid').get(function(req,res){
        console.log(req.params);
        user_controller.get_user_by_id(res,req.params.uid);
    });
    app.route('/getuser-email/:user_email').get(function(req,res){
        console.log(req.params);
        user_controller.get_user_by_email(res,req.params.user_email);
    });
}