const back = require('androidjs').back;

back.on('Hello', function(msg){
    console.log('console Hello');
	back.send('print', `from server ${msg}`);
});