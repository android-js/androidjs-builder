import * as request from 'request';
import * as path from 'path';

export function lsGit(user: string, repo: string, dir: string, callback) {
    if(!callback){
        callback = dir;
        dir = '';
    }
    let options = {
        url: `https://api.github.com/repos/${user}/${repo}/contents/${dir}?ref=HEAD`,
        headers: {
            'User-Agent': 'request'
        }
    };
    request.get(options, callback);
}


export function getDownloadLink(user: string, repo: string, branch ="master") {
    return `https://github.com/${user}/${repo}/archive/${branch}.zip`;
}

/// TODO: need to update this function
// @ts-ignore
export function getFileDownloadLink(user: string, repo: string, dir: string, file?:string) {
    if(file===undefined)return `https://raw.githubusercontent.com/${user}/${repo}/HEAD/${dir}`;
    else return `https://raw.githubusercontent.com/${user}/${repo}/HEAD/${dir}/${file}`
}

// function callback(error, response, body) {
//     if (!error && response.statusCode == 200) {
//         const ls: Array<{name: string, type: string}> = JSON.parse(body);
//         ls.forEach(e => {
//             console.log(e.type.toUpperCase(), e.name);
//         })
//     }
// }




