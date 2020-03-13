import * as fs from 'fs';
import * as path from  'path';
import {Interfaces} from "../../Interfaces";

export function updateIcon(env: Interfaces.IEnv, args) {
    const sdkPath = path.join(env.builder.cache, args.sdk.repo);

    let iconPath = undefined;
    try{
        iconPath = require(path.join(env.project.dir, 'package.json')).icon;
        if(!iconPath){
            console.log("can not find icon path in package.json");
            process.exit();
        }
        if(iconPath[0] === '.') {
            iconPath = path.join(env.project.dir, iconPath);
        }
    }catch (e) {
        console.log('failed to update icon');
        process.exit();
    }


    let icon_paths = [];
    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-hdpi', 'ic_launcher.png'));
    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-hdpi', 'ic_launcher_round.png'));

    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-mdpi', 'ic_launcher.png'));
    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-mdpi', 'ic_launcher_round.png'));

    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-xhdpi', 'ic_launcher.png'));
    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-xhdpi', 'ic_launcher_round.png'));

    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-xxhdpi', 'ic_launcher.png'));
    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-xxhdpi', 'ic_launcher_round.png'));

    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-xxxhdpi', 'ic_launcher.png'));
    icon_paths.push(path.join(sdkPath, 'res', 'mipmap-xxxhdpi', 'ic_launcher_round.png'));

    for(const i in icon_paths){
        fs.writeFileSync(icon_paths[i], fs.readFileSync(iconPath));
    }

}

