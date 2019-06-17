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
        user_controller.get_user_by_id(req, res,req.params.uid);
    });
    app.route('/getuser-email/:user_email').get(function(req,res){
        console.log(req.params);
        user_controller.get_user_by_email(req, res,req.params.user_email);
    });

    app.route('/update-record-id').post(function(req, res){
        let user_data = {};
        console.log(req.body);
        user_data.id = req.body.id;
        user_data.year = req.body.year.split('-')[0];
        user_data.month = req.body.year.split('-')[1];
        user_data.record = req.body.record;
        user_controller.update_user_record_by_id(req,res, user_data);
    })

    app.route('/get-record-id').get(function(req,res){
        user_controller.get_user_record_by_id(req, res, req.query.id);
    })
}