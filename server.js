const express = require('express');
const db_connection = require('./connection');
const bodyParser = require('body-parser');
const path = require("path");
const routes = require('./api/routes/users');

const settings = {
    port: 3000,
    host: 'localhost',
    proto: 'http'
};

const app = express();

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