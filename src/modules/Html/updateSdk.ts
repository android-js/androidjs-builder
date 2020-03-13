import * as path from "path";
const admZip = require('adm-zip');
import {getDownloadLink} from "../../GitListDir";
import {downloadGithubRepo} from "./downloadGithubRepo";
import * as fs from 'fs-extra';

export function updateSdk(env, callback?:Function) {

    const sdkZip = path.join(env.builder.cache, env.sdk.repo + '.zip');
    const sdkFolder = path.join(env.builder.cache);

    console.log("Downloading Androidjs-SDK:", getDownloadLink(env.sdk.user, env.sdk.repo));
    downloadGithubRepo(env.sdk, sdkZip, (error) => {
        if (error) {
            console.log('Failed to download sdk');
            process.exit();
        } else {
            try {
                let zip = new admZip(sdkZip);
                zip.extractEntryTo(env.sdk.repo + '-master/', sdkFolder, true, true);
                fs.rmdirSync(path.join(sdkFolder, env.sdk.repo), {recursive: true});
                fs.renameSync(path.join(sdkFolder, env.sdk.repo + '-master'), path.join(sdkFolder, env.sdk.repo));
                if(callback){
                    callback();
                }
            } catch (e) {
                console.log("Failed to extract sdk");
                process.exit();
            }
        }
    });
}

