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
        // open res/values/colors.xml
        const colorsXML = path.join(env.builder.cache, env.sdk.repo, 'res', 'values', 'colors.xml');

        let parser = new xml2js.Parser();
        let builder = new xml2js.Builder();
        let stylesData = fs.readFileSync(stylesXML);
        let colorsData = fs.readFileSync(colorsXML);
        // colors.xml parse and modify
        parser.parseString(colorsData, function (err, result) { 
            if (err) {
                console.log(`Failed to update theme, colors.xml error code :  ${err}`);
                process.exit();
            }
            try {
                let res = result.resources.color;
                for (let i = 0; i < res.length; i++) {
                    if (res[i].$.name == "colorAccent" && pkg.theme.colorAccent)
                        res[i]._ = pkg.theme.colorAccent; // colorAccent
                    if (res[i].$.name == "colorPrimary" && pkg.theme.colorPrimary)
                        res[i]._ = pkg.theme.colorPrimary; // colorPrimary
                    if (res[i].$.name == "colorPrimaryDark" && pkg.theme.colorPrimaryDark)
                        res[i]._ = pkg.theme.colorPrimaryDark // colorPrimaryDark
                }
                let xml_color = builder.buildObject(result);
                fs.writeFileSync(colorsXML, xml_color);
                if (env.debug) {
                    console.log('Theme colors.xml Updated');
                }
            }    
            catch (e) {
                console.log(`Failed to update theme, colors.xml error code :  ${e}`);
            }
        });

        // styles.xml parse and modify
        parser.parseString(stylesData, function (err, result) {
            if (err) {
                console.log(`Failed to update theme, styles.xml error code :  ${err}`);
                process.exit();
            }
            try {
                // Updating theme
                let thm = result.resources.style[6].item;
                thm[3] = {_: 'true', '$': {name: 'android:windowNoTitle'}};
                thm[4] = {_: 'true', '$': {name: 'android:windowFullscreen'}};
                // thm[5] = {_: 'false', '$': {name: 'android:windowActionBar'}};
                if (pkg.theme.fullScreen) {
                    thm[3]._ = true; //{ _: 'true', '$': { name: 'android:windowNoTitle' } };
                    thm[4]._ = true; //{ _: 'true', '$': { name: 'android:windowFullscreen' } };
                } else {
                    thm[3]._ = true;
                    thm[4]._ = false;
                }
                let xml_styles = builder.buildObject(result);
                fs.writeFileSync(stylesXML, xml_styles);
                if (env.debug) {
                    console.log('Theme styles.xml Updated');
                }
                callback();
            }
            catch (e) {
                console.log(`Failed to update theme, styles.xml error code :  ${e}`);
                callback(e);
            }
        });
    }
}


