module.exports = function(app){
    app.route('/login').get(function(req, res){
        if(req.session.user_id) res.redirect('/Template.html');
        else res.redirect('/login/index.html')
        // console.log("this route called")
        // if(req.session.user_id){
            // console.log(req.session);
            // console.log(req.session.user_id);
        // }
    })
}