const path = require('path');

module.exports = function(app){
    app.route('/login').get(function(req, res){
        if(req.session.user_id) res.redirect('/');
        else res.sendFile(path.join(__dirname,'../views/login.html'));
        // console.log("this route called")
        // if(req.session.user_id){
            // console.log(req.session);
            // console.log(req.session.user_id);
        // }
    })

    app.route('/').get(function(req,res){
        if(req.session.user_id) res.sendFile(path.join(__dirname,'../views/Template2.html'));
        else res.redirect('/login');
    })
}