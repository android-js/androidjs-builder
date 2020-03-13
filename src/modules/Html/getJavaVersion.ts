export function javaVersion(callback) {
    const spawn = require('child_process').spawn('java', ['-version']);
    let flag = false;
    spawn.stderr.on('data', function(data) {
        data = data.toString().split('\n')[0];
        const javaVersion = new RegExp('java version').test(data) ? data.split(' ')[2].replace(/"/g, '') : false;
        if (javaVersion != false) {
            // TODO: We have Java installed
            console.log("Using Java:", javaVersion);
            flag = true;
            return callback(false, javaVersion);
        } else {
            // TODO: No Java installed
            // callback({message: 'can not find java version'}, null);
        }
    });
    spawn.on('close', (code)=> {
        if(flag===false){
            flag = true;
            callback({message: 'can not find java version'}, null)
        }
    });
    spawn.on('error', function(err){
        if(flag===false){
            flag = true;
            return callback({message: 'can not find java version'}, null)
        }
    });
}
