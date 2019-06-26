
const user_controller = require('../controllers/users');

module.exports = function(app){
    app.route('/api/newuser').post(function(req, res){
        let user = {}
        user.name = req.body.name;
        user.email = req.body.email;
        user.password = req.body.password;
        user.mobile = req.body.mobile;
        user.category = req.body.category;
        user.taxpayer = req.body.texpayer;

        user_controller.insert(req, res, user);
    });
    app.route('/api/delete-id/:uid').get(function(req, res){
        user_controller.delete_id(res, req.params.uid);
    });

    app.route('/api/showusers').get(function(req,res){
        user_controller.get_all_users(req,res);
    });

    app.route('/api/getuser-id/:uid').get(function(req,res){
        console.log(req.params);
        user_controller.get_user_by_id(req, res,req.params.uid);
    });
    // app.route('/getuser-email/:user_email').get(function(req,res){
    //     console.log(req.params);
    //     user_controller.get_user_by_email(req, res,req.params.user_email);
    // });

    app.route('/api/update-record-id').post(function(req, res){
        let user_data = {};
        console.log(req.body);
        user_data.id = req.body.id;
        user_data.year = req.body.year.split('-')[0];
        user_data.month = req.body.year.split('-')[1];
        user_data.record = req.body.record;
        user_controller.update_user_record_by_id(req,res, user_data);
    })

    app.route("/api/clean-record-id").get(function(req, res){
        user_controller.clean_user_record_by_id(req, res, req.query.id);
    })


    app.route('/api/get-record-id').get(function(req,res){
        let year = req.query.date.split('-')[0];
        let month = req.query.date.split('-')[1];
        user_controller.get_user_record_by_id(req, res, req.query.id, year, month);
    })

    app.route('/api/user-login').get(function(req,res){
        user_controller.get_user_by_email_and_password(req, res, req.query.email, req.query.password);
    })

    app.route('/api/user-logout').get(function(req,res){
        req.session = null;
        res.send({status: "success"});
    })

    app.route('/api/get-net-taxable-income').get(function(req,res){
        user_controller.get_net_taxable_income(req,res, req.query.date);
    })

    app.route('/api/current-login-user').get(function(req,res){
        user_controller.current_login_user(req, res);
    })

}