const path = require('path');
const { copyDir } = require('./copyDir');


function copyExample(args) {

    return new Promise((resolve, reject) => {
        let __from__ = path.join(args.BUILDER__cwd, 'example', args.app_name);
        let __to__ = args.PROJECT__cwd;

        console.log('Generating Example...');

        if(args.DEBUG) {
            console.log("From:", __from__);
            console.log("To:", __to__);
        }

        copyDir(__from__, __to__, [])
            .then(() => {
                resolve(0);
                console.log('Example Generated !');
            }).catch(reason => {
                console.log(reason);
                console.log('Failed to copy example');
                reject(-1);
        });
    });
}


module.exports = {
    copyExample
};
