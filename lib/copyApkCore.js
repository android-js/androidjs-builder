const path = require('path');
const { copyDir } = require('./copyDir');
const fs = require('fs');

function copyApkCore(args) {

    return new Promise((resolve, reject) => {
        if (!fs.existsSync(args.PROJECT__dist)) {
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
