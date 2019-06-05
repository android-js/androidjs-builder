const express = require('express');
const db_connection = require('./connection');
const bodyParser = require('body-parser');
const routes = require('./api/routes/uesrs');


const app = express();
const port = 3000;

db_connection.connect();

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

routes(app);

app.listen(port, function(){
    console.log(`Server is listening on port ${port}!`);
});