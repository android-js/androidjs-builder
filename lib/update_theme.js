const fs = require('fs');
const xml2js = require('xml2js');
const path = require('path');

var androidjs;

function init(_androidjs){
    androidjs = _androidjs;
    console.log("Testing 'Theme Update' ...");
}


function update(){
    return new Promise((res, rej)=>{
        console.log(`updating...  ${androidjs}` );
        let pkg = require(path.join(androidjs.project.paths.__dirname, 'package.json'));
        let theme = pkg.theme;
        if(theme === undefined){
            console.log('theme attribute not found in package.json');
            res(0);
        }else{
            // load theme from package.json
            console.log(pkg.theme);
            let statusBar = theme.statusBar;
            let statusBarColor = theme.statusBarColor;

            // open res/values/styles.xml
            const stylesXML = path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo, 'res', 'values', 'styles.xml');
            let parser = new xml2js.Parser();
            let builder = new xml2js.Builder();


            fs.readFile(stylesXML, function (err, data) {
                if (err) rej(err);

                parser.parseString(data, function (err, result) {
                    if (err) rej(err);

                    // console.log(result.resources.style[6].item);
                    let thm = result.resources.style[6].item;
                    thm[3] = { _: 'true', '$': { name: 'android:windowNoTitle' } };
                    thm[4] = { _: 'true', '$': { name: 'android:windowFullscreen' } };

                    // updating theme
                    thm[0]._ = pkg.theme.colorAccent || '@color/colorAccent'; // colorAccent
                    thm[1]._ = pkg.theme.colorPrimary || '@color/colorPrimary'; // colorPrimary
                    thm[2]._ = pkg.theme.colorPrimaryDark || '@color/colorPrimaryDark'; // colorPrimaryDark

                    if(pkg.theme.fullScreen){
                        thm[3]._ = true; //{ _: 'true', '$': { name: 'android:windowNoTitle' } };
                        thm[4]._ = true; //{ _: 'true', '$': { name: 'android:windowFullscreen' } };
                    }else {
                        thm[3]._ = false;
                        thm[4]._ = false;
                    }


                    console.log(thm);
                    let xml = builder.buildObject(result);
                    fs.writeFile(stylesXML, xml, function (err, data) {
                        if (err) rej(err);
                        console.log('Done!');
                        res(0);
                    });


                    // fs.writeFile('test.json', JSON.stringify(result, null, 4), ()=>{
                    //     console.log("Done");
                    // });
                });
            });
        }
    });
}


module.exports = {
    init,
    update
}