const fs = require('fs');
const xml2js = require('xml2js');
const path = require('path');

export function updateTheme(env, callback) {
    console.log(`updating theme ...`);
    let pkg = require(path.join(env.project.dir, 'package.json'));
    let theme = pkg.theme;
    if (theme === undefined) {
        console.log('theme attribute not found in package.json');
        callback();
    } else {
        // open res/values/styles.xml
        const stylesXML = path.join(env.builder.cache, env.sdk.repo, 'res', 'values', 'styles.xml');
        let parser = new xml2js.Parser();
        let builder = new xml2js.Builder();

        let data = fs.readFileSync(stylesXML);
        parser.parseString(data, function (err, result) {
            if (err) {
                console.log("Failed to update theme");
                process.exit();
            } else {

                try {
                    // Updating theme
                    let thm = result.resources.style[6].item;
                    thm[3] = {_: 'true', '$': {name: 'android:windowNoTitle'}};
                    thm[4] = {_: 'true', '$': {name: 'android:windowFullscreen'}};
                    thm[5] = {_: 'false', '$': {name: 'android:windowActionBar'}};


                    thm[0]._ = pkg.theme.colorAccent || '@color/colorAccent'; // colorAccent
                    thm[1]._ = pkg.theme.colorPrimary || '@color/colorPrimary'; // colorPrimary
                    thm[2]._ = pkg.theme.colorPrimaryDark || '@color/colorPrimaryDark'; // colorPrimaryDark

                    if (pkg.theme.fullScreen) {
                        thm[3]._ = true; //{ _: 'true', '$': { name: 'android:windowNoTitle' } };
                        thm[4]._ = true; //{ _: 'true', '$': { name: 'android:windowFullscreen' } };
                    } else {
                        thm[3]._ = false;
                        thm[4]._ = false;
                    }

                    let xml = builder.buildObject(result);
                    fs.writeFileSync(stylesXML, xml);
                    if (env.debug) {
                        console.log('Theme Updated');
                    }
                    callback();
                }
                catch (e) {
                    console.log("Failed to update theme");
                    callback(e);
                }

            }
        });
    }
}


