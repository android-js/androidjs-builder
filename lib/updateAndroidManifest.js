const path = require('path');
const fs = require('fs');

const xml2js = require('xml2js');


function updateAndroidManifest(args) {

    return new Promise((resolve, reject) => {
        let pkg = require(path.join(args.PROJECT__cwd, 'package.json'));
        const AndroidManifest = path.join(args.PROJECT__dist, 'app-debug', 'AndroidManifest.xml');

        let app_name = pkg['app-name'];
        let package_name = pkg['package-name'];

        if (package_name === undefined || app_name === undefined) {
            console.log("'app-name' or 'package-name' not define in package.json");
            reject(-1);
        }

        console.log('reading ', AndroidManifest);

        let parser = new xml2js.Parser();
        let builder = new xml2js.Builder();


        fs.readFile(AndroidManifest, function (err, data) {
            parser.parseString(data, function (err, result) {
                // console.dir(result);
                result.manifest['$'].package = 'com.androidjs.' + package_name;

                console.log('package name', result.manifest['$'].package);

                // if(result.manifest['uses-permission'] === undefined) {
                result.manifest['uses-permission'] = [];
                // }

                for (var i = pkg.permission.length - 1; i >= 0; i--) {
                    let permission = {'$': {'android:name': pkg.permission[i]}};
                    result.manifest['uses-permission'].push(permission);
                }

                for (var i = result.manifest['uses-permission'].length - 1; i >= 0; i--) {
                    console.log(result.manifest['uses-permission'][i]);
                }

                let xml = builder.buildObject(result);

                fs.writeFile(AndroidManifest, xml, function (err, data) {
                    if (err) throw err;
                    console.log('Done!');
                    resolve(0);
                });

            });
        });
    });
}


module.exports = {
    updateAndroidManifest
};