import * as path from 'path';
import {Interfaces} from "../../Interfaces";
import IEnv = Interfaces.IEnv;
import IDeepLink = Interfaces.IDeepLink;

let header = `<?xml version="1.0" encoding="utf-8" standalone="no"?>\n`;

class Node {
    name: string = '';
    keys: {[key:string]: string};
    children: Array<Node> = [];
    constructor({name, keys={}}) {
        this.name = name;
        this.keys = {...keys};
    }
    render({padding, paddingValue}): string {
        let data = '';
        data += ' '.repeat(padding) + `<${this.name} `;
        for(const key in this.keys) {
            data += `${key}="${this.keys[key]}" `;
        }
        if(this.children.length === 0) {
            data += `/>\n`;
        }else{
            data += `>\n`;
        }
        for(const i in this.children){
            data += this.children[i].render({padding:padding+paddingValue, paddingValue});
        }
        if(this.children.length !== 0) {
            data += ' '.repeat(padding) + `</${this.name}>\n`
        }
        return data;
    }
}

function createPermission(permission){
    return new Node({
        name: 'uses-permission',
        keys: {
            'android:name': permission
        }
    });
}

function createDeepLink(deep_link:IDeepLink): Node {
        let filter = new Node({name: 'intent-filter'});
        let action = new Node({
            name: 'action',
            keys: {
                'android:name': 'android.intent.action.VIEW'
            }
        });
        let data = new Node({
            name: 'data',
            keys: {
                'android:scheme': deep_link.scheme,
                'android:host': deep_link.host
            }
        });
        let category1 = new Node({
            name: 'category',
            keys: {
                'android:name': 'android.intent.category.DEFAULT'
            }
        });
        let category2 = new Node({
            name: 'category',
            keys: {
                'android:name': 'android.intent.category.BROWSABLE'
            }
        });
        filter.children.push(action);
        filter.children.push(data);
        filter.children.push(category1);
        filter.children.push(category2);
    return filter;
}

export function getManifest(env: IEnv, args, permissions: Array<string>, deep_links: Array<Interfaces.IDeepLink>, screenOrientation: String = null): string {
    let package_name = env.project.package["package-name"];
    let env_manifist = args.manifist;
    
    const sdkPath = path.join(env.builder.cache, args.sdk.repo);

    if(!package_name){
        console.log("can not find package-name");
        process.exit();
    }
    let manifest = new Node({
        name: 'manifest',
        keys: {
            'xmlns:android': "http://schemas.android.com/apk/res/android",
            'package':`com.androidjs.${package_name}`,
            platformBuildVersionCode: env_manifist.platformBuildVersionCode,
            platformBuildVersionName: env_manifist.platformBuildVersionName
        }
    });

    let application = new Node({
        name: 'application',
        keys: env_manifist.application
    });

    let activity = new Node({
        name: 'activity',
        keys: env_manifist.activity
    });

    if(screenOrientation !== null) {
        // @ts-ignore
        activity.keys['android:screenOrientation'] = screenOrientation;
    }

    let intent_filter = new Node({name: 'intent-filter'});
    intent_filter.children.push(new Node({
        name: 'action',
        keys: {
            'android:name':"android.intent.action.MAIN"
        }
    }));
    intent_filter.children.push(new Node({
        name: 'category',
        keys: {
            'android:name':"android.intent.category.LAUNCHER"
        }
    }));

    manifest.children.push(application);
    application.children.push(activity);
    activity.children.push(intent_filter);


    for(const i in permissions) {
        manifest.children.push(createPermission(permissions[i]));
        if(env.builder.debug)console.log('Adding:', permissions[i]);
    }

    for(const i in deep_links){
        let deepLink = createDeepLink(deep_links[i]);
        activity.children.push(deepLink)
    }
    if(env.builder.debug) {
        console.log("Built AndroidManifest.xml")
        console.log("   platformBuildVersionCode:", env_manifist.platformBuildVersionCode)
        console.log("   platformBuildVersionName:", env_manifist.platformBuildVersionName)
    }
    return header + manifest.render({padding:0, paddingValue: 4});
}
