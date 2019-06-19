module.exports = function(app){
    app.route('/login').get(function(req, res){
        console.log("this route called")
        // if(req.session.user_id){
            console.log(req.session);
            console.log(req.session.user_id);
        // }
    })
}