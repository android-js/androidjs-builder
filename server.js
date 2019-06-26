const express = require('express');
const db_connection = require('./connection');
const bodyParser = require('body-parser');
const path = require("path");
const api_routes = require('./api/routes/users');
const routes = require('./routes/web');
const session = require('cookie-session');

const settings = {
    port: 3000,
    host: '127.0.0.1',
    proto: 'http'
};

const app = express();

// app.set('views', path.join('./assets/views/'));
// app.set('view engine', 'ejs');

app.set('trust proxy', 1);

app.use(session({
    name:'session',
    keys: ["Chhekur@Pankaj@Pawan", 'gjhgjhgjh'],
}))

db_connection.connect();

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

api_routes(app);
routes(app);

app.use('/static', express.static(path.join(__dirname, 'assets')));

app.listen(settings.port, settings.host, function(){
    console.log(`Server is listening on port :\n${settings.proto}://${settings.host}:${settings.port}`);
});