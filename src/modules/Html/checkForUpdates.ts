import {Interfaces} from "../../Interfaces";

const dns = require('dns');
import {lsGit, getDownloadLink, getFileDownloadLink} from '../../GitListDir';
import {downloadGithubFile} from './downloadGithubFile';
import * as path from  'path';
import * as fs from 'fs';
const semver = require('semver');


let isSearchComplete = false;
let isAvailable = false;
let _hostname = '';
let _service = '';

interface IUpdate {
    packageName: string
    oldVersion: string
    newVersion: string
}


let msg:string = '';


dns.lookupService('8.8.8.8', 53, function(err, hostname, service){
    isSearchComplete = true;
    if(err) {

    }else {
        _hostname = hostname;
        _service = service;
        if(_hostname.length>0 && _service.length>0){
            isAvailable = true;
        }
    }
    // google-public-dns-a.google.com domain
});


function getSdkVersion(env, callback) {
    let tempFilePath = path.join(env.builder.cache, 'TEMP-'+Date.now().toString()+'.json');
    let sdkConfigFileLink = getFileDownloadLink(env.sdk.user, env.sdk.repo, 'config.json');
    let _sdkConfigFileLink:Interfaces.GithubFileLink = {
        user: env.sdk.user,
        repo: env.sdk.repo,
        file: 'config.json',
        dir: ''
    };

    downloadGithubFile(_sdkConfigFileLink, tempFilePath, ()=>{
        try {
            let sdkConfig = require(tempFilePath);
            fs.unlinkSync(tempFilePath);
            callback(sdkConfig.version);
        }catch (e) {
            ///...
        }
    }, false);
}

export  function getUpdate(env) {
    return new Promise(resolve => {
        let loopCount = 0;
        let loop = setInterval(()=>{
            // check for 5 seconds for network connectivity
            if(++loopCount === 5) {
                clearInterval(loop);
            }
            if(isSearchComplete && (true || clearInterval(loop))) {
                if(isAvailable){
                    try{
                        let oldSdk = require(path.join(env.builder.cache, env.sdk.repo, 'config.json'));
                        getSdkVersion(env, sdkVersion => {
                            if(semver.lt(oldSdk.version, sdkVersion)){
                                msg = `Androidjs-sdk: ${sdkVersion} available`;
                                msg += `Update using $androidjs u`;

                            } else {
                                ///...
                            }
                        });
                    }catch (e) {
                        ///...
                    }
                }
            }else {
                /// if search is not complete then do nothing for 5 seconds
            }
        }, 1000);



    });
}

export function getUpdateMessage() {
    if(msg.length > 1){
        console.log(msg);
    }
}
