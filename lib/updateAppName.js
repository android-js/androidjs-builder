const path = require('path');
const fs = require('fs');

const xml2js = require('xml2js');





function updateAppName(args) {
    return new Promise((resolve, reject) => {
        let ValuesFile = path.join(args.PROJECT__dist, 'app-debug', 'res', 'values', 'strings.xml');
        console.log('changing app name', ValuesFile);

        let pkg = require(path.join(args.PROJECT__cwd, 'package.json'));

        let app_name = pkg['app-name'];
        if(app_name === undefined) {
            console.log("'app-name' not found in package.json");
            reject(-1);
        }


        let parser = new xml2js.Parser();
        let builder = new xml2js.Builder();


        fs.readFile(ValuesFile, function(err, data) {
                parser.parseString(data, function (err, result) {

                    // find and replace app name
                    for (var i = result.resources.string.length - 1; i >= 0; i--) {
                        if(result.resources.string[i]['$'].name === 'app_name') {
                            result.resources.string[i]._ = app_name;
                            console.log(result.resources.string[i]);
                        }
                    }

                    var xml = builder.buildObject(result);

                    fs.writeFile(ValuesFile, xml, function(err, data) {
                        if(err) throw err;
                        resolve(0);
                    });

                });
            });

    });

}




module.exports = {
    updateAppName
};