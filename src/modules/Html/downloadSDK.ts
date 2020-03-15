#!/usr/bin/env node

import * as fs from 'fs';
import * as request from 'request';
import {LoadingBar} from './ProgressBar';

export function downloadSDK(env, url, to, callback: Function) {
    // process.stdout.write(`Downloading ${link}`);
    let fileStream = fs.createWriteStream(to);

    let loading = new LoadingBar();
    let receivedBytes = 0;
    request
        .get({url: url, headers: {'User-Agent': 'request'}})
        .on('response', response => {
            if(response.statusCode === 200) {
                loading.start();
                // bar.total = parseInt(response.headers['content-length']);
                // console.log("H:",parseInt(response.headers['content-length']));
            } else {
                console.log("error");
            }
        })
        .on('data', (chunk) => {
            receivedBytes += chunk.length;
        })
        .on('end', (code)=>{
            loading.stop();
        })
        .on('error', (err) => {
            // @ts-ignore
            fs.unlink(local_file);
            loading.stop();
        })
        .pipe(fileStream);
    // callback();
}
