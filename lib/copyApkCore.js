const path = require('path');
const { copyDir } = require('./copyDir');
// const fs = require('fs');
var fs = require('fs-extra');

function copyApkCore(args) {

    return new Promise((resolve, reject) => {

    	console.log(args);

    	fs.remove(path.join(args.PROJECT__dist, 'app-debug', 'assets', 'myapp'), ()=>{
    		console.log('User assets cleared');
    	});

        if (!fs.existsSync(path.join(args.PROJECT__dist, 'app-debug','AndroidManifest.xml'))) {
            copyDir(path.join(args.BUILDER__cwd, 'bin', 'dist'), args.PROJECT__dist, [])
                .then(() => {
                    console.log('app core copied !');
                    resolve(0);
                }).catch(reason => {
                console.log('ERROR: failed to copy app core', __filename);
                reject(-1);
            });
        } else {
            if (args.force_replace === true) {



                copyDir(path.join(args.BUILDER__cwd, 'bin', 'dist'), args.PROJECT__dist, [])
                    .then(() => {
                        console.log('app core copied !');
                        resolve(0);
                    }).catch(reason => {
                    console.log('ERROR: failed to copy app core', __filename);
                    reject(-1);
                });
            } else {
                console.log('skipped to copy core module !');
                resolve(0);
            }
        }
        if (args.DEBUG) console.log(args);
    });



}


module.exports = {
    copyApkCore
};
