import {Interfaces} from "../../Interfaces";
import IEnv = Interfaces.IEnv;

const path = require('path');
const fs = require('fs');
const chalk = require("chalk");
const xml2js = require('xml2js');

export function updateAppName(env: IEnv, args) {
    console.log('updating app name...');

    const sdkPath = path.join(env.builder.cache, args.sdk.repo);

    try {

        let pkg = env.project.package;
        let stringFilePath = path.join(sdkPath, 'res', 'values', 'strings.xml');
        let data = fs.readFileSync(stringFilePath).toString();
        let index = data.indexOf('app_name');
        let startIndex = 0, lastIndex = 0;
        while (startIndex == 0) {
            index++;
            if (data[index] === '>') {
                startIndex = index + 1;
            }
        }

        while (lastIndex == 0) {
            index++;
            if (data[index] === '<') {
                lastIndex = index;
            }
        }

        data = data.replace('>' + data.slice(startIndex, lastIndex) + '<', `>${pkg["app-name"]}<`);
        fs.writeFileSync(stringFilePath, data);
    }catch (e) {
        console.log(`Failed to update app name`);
        process.exit();
    }
}
