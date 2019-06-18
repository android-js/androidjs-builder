const express = require('express');
const db_connection = require('./connection');
const bodyParser = require('body-parser');
const path = require("path");
const routes = require('./api/routes/users');
const session = require('.express-session');

const settings = {
    port: 3000,
    host: 'localhost',
    proto: 'http'
};

const app = express();

app.set('trust proxy', 1);
app.use(session({
    secret: "Chhekur@Pankaj@Pawan",
    resave: false,
    saveUninitialized: true,
    cookie: {secure: true}
}))

db_connection.connect();

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

routes(app);

app.use(express.static('./views'));
app.use('/static', express.static(path.join(__dirname, 'data')));
app.use('/static', express.static(path.join(__dirname, 'assets')));

app.listen(settings.port, settings.host, function(){
    console.log(`Server is listening on port :\n${settings.proto}://${settings.host}:${settings.port}`);
});