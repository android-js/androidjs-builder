import {LoadingBar} from './ProgressBar';
import * as request from 'request';
import {lsGit, getDownloadLink, getFileDownloadLink} from '../../GitListDir';
import * as fs from 'fs-extra';
import {Interfaces} from "../../Interfaces";



export function downloadGithubFile(githubFileLink: Interfaces.GithubFileLink, file, callback, showProgress?:boolean) {
    let downloadLink:string = '';
    if(githubFileLink.dir && githubFileLink.dir.length>0) {
        downloadLink = getFileDownloadLink(githubFileLink.user, githubFileLink.repo, githubFileLink.dir, githubFileLink.file);
    }else {
        downloadLink = getFileDownloadLink(githubFileLink.user, githubFileLink.repo, githubFileLink.file);
    }

    let writeStream = fs.createWriteStream(file);
    let progress = new LoadingBar();
    request.get(downloadLink)
        .on('response', (res) =>{
            if(res.statusCode === 200){
                if(showProgress) {
                    progress.start();
                }
            }
        })
        .on('data', (chunk)=> {
            progress.chunksDownloaded += chunk.length;
        })
        .on('end', (code)=> {
            if(showProgress) {
                progress.stop();
            }
            callback();
        })
        .on('error', (error)=> {
            if(showProgress) {
                progress.stop();
            }
            callback(error);
        })
        .pipe(writeStream);
}





