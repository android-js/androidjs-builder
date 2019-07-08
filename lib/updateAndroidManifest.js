const path = require('path');
const fs = require('fs');
const xml2js = require('xml2js');
const chalk = require("chalk");

function updateAndroidManifest(androidjs) {

    return new Promise((resolve, reject) => {

        let pkg = require(path.join(androidjs.project.paths.__dirname, 'package.json'));
        const AndroidManifest = path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo, 'AndroidManifest.xml');


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
                console.dir(result);
                result.manifest['$'].package = 'com.android.js.' + package_name;

                console.log('package name', result.manifest['$'].package);

                /**!
                 * set user permissions
                 * @type {Array}
                 */
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

                /**!
                 * set deep linking
                 * @type {Array}
                 */

                let default_linkings = [];
                // console.log('activity : ',result.manifest.application[0].activity[0]['intent-filter']);
                if (pkg['deep-link'] !== undefined) {

                    // for each link
                    result.manifest.application[0].activity[0]['intent-filter'] = [];
                    result.manifest.application[0].activity[0]['intent-filter'].push(
                        {
                            'action': [
                                {
                                    '$': {
                                        'android:name': 'android.intent.action.MAIN'
                                    }
                                },
                            ],
                            'category': [
                                {
                                    '$': {
                                        'android:name': 'android.intent.category.LAUNCHER'
                                    }
                                }
                            ]
                        }
                    );
                    for (let i = 0; i < pkg['deep-link'].length; i++) {

                        if (pkg['deep-link'][i].scheme !== undefined && pkg['deep-link'][i].host !== undefined) {
                            console.log(chalk.red('testing'));
                            console.log(result.manifest.application[0].activity[0]['intent-filter']);

                            result.manifest.application[0].activity[0]['intent-filter'].push(
                                {
                                    'action': [
                                        {
                                            '$': {
                                                'android:name': 'android.intent.action.VIEW'
                                            }
                                        },
                                    ],
                                    'data': [
                                                {
                                                    '$':{
                                                        'android:scheme': pkg['deep-link'][i].scheme,
                                                        'android:host': pkg['deep-link'][i].host
                                                    }

                                                }
                                            ],
                                    'category': [
                                        {
                                            '$': {
                                                'android:name': 'android.intent.category.DEFAULT'
                                            }
                                        },
                                        {
                                            '$': {
                                                'android:name': 'android.intent.category.BROWSABLE'
                                            }
                                        }
                                    ]
                                }
                            )
                        } else {
                            console.log(chalk.red('invalid deep-link format ') + 'visit https://android-js.github.io/androidjs/deeplink_api.html');
                        }
                    }

                }
                // result.manifest.application[0].activity['intent-filter'] = [];
                // result.manifest.application[0].activity['intent-filter'].push({'$':{'action':{'android:name':'android.intent.action.MAIN'}}, 
                // 'category':{'android:name':'android.intent.category.LAUNCHER'}});

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