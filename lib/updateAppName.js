const path = require('path');
const fs = require('fs');
const chalk = require("chalk");
const xml2js = require('xml2js');

function updateAppName(androidjs) {
    return new Promise((resolve, reject) => {

        // required files (<builder>/strings.xml, <project>/package.json)
        let ValuesFile = path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo, 'res', 'values', 'strings.xml');
        let pkg = require(path.join(androidjs.project.paths.__dirname, 'package.json'));

         console.log('Updating', ValuesFile);

        let app_name = pkg['app-name'];
        if(app_name === undefined) {
            console.log("'app-name' not found in package.json");
            reject(-1);
        }


        let parser = new xml2js.Parser();
        let builder = new xml2js.Builder();


        fs.readFile(ValuesFile, function(err, data) {
            if(err) {
                reject(chalk.red('Not found ')+ValuesFile);
            } else {

                // parsing xml to json
                parser.parseString(data, function (err, result) {
                    if(err) {
                        reject(chalk.red('parsing error, failed to parse ')+ValuesFile);
                    } else {


                        // find and replace app name
                        for (var i = result.resources.string.length - 1; i >= 0; i--) {
                            if (result.resources.string[i]['$'].name === 'app_name') {
                                result.resources.string[i]._ = app_name;
                                console.log(result.resources.string[i]);
                            }
                        }

                        // rebuild xml from js Object
                        let xml = builder.buildObject(result);

                        fs.writeFile(ValuesFile, xml, function (err, data) {
                            if (err) throw err;

                            // successfully updated values
                            else resolve(0);
                        });
                    }

                });
            }
        });

    });

}




module.exports = {
    updateAppName
};