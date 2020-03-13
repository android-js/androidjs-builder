import * as fs from 'fs-extra';

export function createIfNotExist(path) {
    if(!fs.existsSync(path)){
        fs.mkdirs(path);
    }
    return path;
}



