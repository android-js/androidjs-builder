import {LoadingBar} from './ProgressBar';
import * as request from 'request';
import {lsGit, getDownloadLink, getFileDownloadLink} from '../../GitListDir';
import * as fs from 'fs-extra';
import {Interfaces} from "../../Interfaces";


export function downloadGithubRepo(githubReplLink: Interfaces.IGithubRepoLink, file, callback) {
    let downloadLink = getDownloadLink(githubReplLink.user, githubReplLink.repo);
    let writeStream = fs.createWriteStream(file);
    let progress = new LoadingBar();
    request.get(downloadLink)
        .on('response', (res) =>{
            if(res.statusCode === 200){
                progress.start();
            }
        })
        .on('data', (chunk)=> {
            progress.chunksDownloaded += chunk.length;
        })
        .on('end', (code)=> {
            progress.stop();
            callback();
        })
        .on('error', (error)=> {
            progress.stop();
            console.log("ERROR:", error);
            callback(error);
        })
        .pipe(writeStream);
}





