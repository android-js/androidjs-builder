import {Interfaces} from "../../Interfaces";
import * as path from "path";
import * as fs from 'fs';
import { parse, render } from 'modify-xml';

export function update(env: Interfaces.IEnv): number {
    try {

        // loading required files
        const pkg = require(path.join(env.project.dir, 'package.json'));
        const androidManifestPath = path.join(env.builder.cache, 'AndroidManifest.xml');


        let app_name = pkg['app-name'];
        let package_name = pkg['package-name'];
        let permissions: Array<string> = pkg['permission'];

        if (package_name === undefined || app_name === undefined) {
            console.warn("'app-name' or 'package-name' not define in package.json");
            process.exit();
        }
        /// Debug
        if (env.builder.debug) {
            console.log(`App name: ${app_name}`);
        }

        // let parser = new xml2js.Parser({});
        // let builder = new xml2js.Builder();

        let androidManifest = fs.readFileSync(androidManifestPath);
        // let parsedManifest = parser.parseString();

        // updating package name
        let data = androidManifest.toString().replace('"com.android.js.webview"', `"com.android.js.${package_name}"`);
        const document = parse(data);
        console.log('Package name:', document['childNodes'][1]['attributes']['package']);


        // set user permissions
        for(const i in permissions) {
            let permission = permissions[i];
            if(env.builder.debug){
                console.log(`Adding '${permission.slice(19)}' permission`);
            }
            document['childNodes'][1]['childNodes'].push({
                "type": "element",
                "name": "uses-permission",
                "childNodes": [],
                "attributes": {
                    "android:name": permission
                },
                "selfClosing": true,
                "openTag": `<uses-permission android:name=\"${permission}\"/>`,
                "closeTag": `<uses-permission android:name=\"${permission}\"/>`
            });
            document['childNodes'][1]['childNodes'].push({
                "type": "text",
                "value": "\n    "
            });
        }

        // set intent filter


        fs.writeFileSync('../../androidManifest.json', JSON.stringify(document, null, 4));


        // saving back to sdk folder
        const result = render(document, { indent: '  ' });
        fs.writeFileSync(path.join(env.builder.cache, 'sdk', 'AndroidManifest.xml'), result);
    }
    catch (e) {
        console.log(`Failed to update android manifest`, e.message);
        process.exit();
    }
    return 0;
}

