import '../Interfaces';
import {Interfaces} from '../Interfaces';
import * as path from 'path';
import {getDownloadLink, getFileDownloadLink} from '../GitListDir';

const request = require('request');


import * as fs from 'fs-extra';
import {spawn} from 'child_process';
import {getManifest} from './Html/ManifestBuilder';
import {updateIcon} from './Html/updateIcon';
import {updateAppName} from './Html/updateAppName';
import {createIfNotExist} from './Html/createIfNotExist';
import {downloadGithubFile} from './Html/downloadGithubFile';
import {downloadGithubRepo} from './Html/downloadGithubRepo';
import {LoadingBar} from './Html/ProgressBar';
import {javaVersion} from './Html/getJavaVersion';
import {getUpdate, getUpdateMessage} from './Html/checkForUpdates';
import {updateTheme} from "./Html/updateAppTheme";

const chalk = require('chalk');

const admZip = require('adm-zip');


/**
 * Webview module for creating HTML based Android-Js project
 */
export class Webview implements Interfaces.IBuilderModule {
    env: Interfaces.IEnv;
    user: string = 'android-js';
    sdk: Interfaces.IGithubRepoLink = {
        user: 'android-js',
        repo: 'androidjs-sdk'
    };
    example: Interfaces.IGithubRepoLink = {
        user: 'android-js',
        repo: 'webview-app-template'
    };
    apk_tool: Interfaces.GithubFileLink = {
        user: 'android-js',
        repo: 'androidjs-builder',
        dir: 'build_tools',
        file: 'apktool.jar'
    };
    apk_signer: Interfaces.GithubFileLink = {
        user: 'android-js',
        repo: 'androidjs-builder',
        dir: 'build_tools',
        file: 'uber-apk-signer-1.0.0.jar'
    };

    context: {};

    installModule(env: Interfaces.IEnv, context): number {
        // init
        this.env = env;
        this.context = context;
        //@ts-ignore
        this.context.updateSdk = () => require('./Html/updateSdk').updateSdk(this.env);
        //@ts-ignore
        env.sdk = this.sdk;
        getUpdate(env);
        // check if sdk folder exist
        // if (this.env.builder.debug) {
        //     try {
        //         let sdk_config = require(path.join(this.sdk, 'config.json'));
        //         console.log(`SDK version: ${sdk_config.version}`);
        //     } catch (e) {
        //         console.log(`Failed to load: ${path.join(this.sdk, 'config.json')}\n`, e.message);
        //     }
        // }

        //     // downloading sdk
        //     if (!fs.existsSync(this.sdk) || this.env.force) {
        //         this.downloadSKD(() => {
        //             ////////////////////////////////////////////////
        //             // downloading build tools
        //             // apk-tool
        //             if (!fs.existsSync(path.join(this.env.builder.cache, this.apk_tool.file))) {
        //                 let apk_tool_download_link = getFileDownloadLink(this.apk_tool.user, this.apk_tool.repo, this.apk_tool.dir, this.apk_tool.file);
        //                 console.log(apk_tool_download_link);
        //                 console.log(`downloading: ${this.apk_tool.file} ...`);
        //                 request.get(apk_tool_download_link).on('error', (e) => {
        //                     console.log(e);
        //                 }).pipe(fs.createWriteStream(path.join(this.env.builder.cache, this.apk_tool.file)));
        //             }
        //
        //             // apk-signer
        //             if (!fs.existsSync(path.join(this.env.builder.cache, this.apk_signer.file))) {
        //                 let apk_signer_download_link = getFileDownloadLink(this.apk_signer.user, this.apk_signer.repo, this.apk_signer.dir, this.apk_signer.file);
        //                 console.log(apk_signer_download_link);
        //                 console.log(`downloading: ${this.apk_signer.file} ...`);
        //                 request.get(apk_signer_download_link).on('error', (e) => {
        //                     console.log(e);
        //                 }).pipe(fs.createWriteStream(path.join(this.env.builder.cache, this.apk_signer.file)));
        //             }
        //             //////////////////////////////////////
        //         });
        //         return 0;
        //     } else {
        //         // downloading build tools
        //         // apk-tool
        //         if (!fs.existsSync(path.join(this.env.builder.cache, this.apk_tool.file))) {
        //             let apk_tool_download_link = getFileDownloadLink(this.apk_tool.user, this.apk_tool.repo, this.apk_tool.dir, this.apk_tool.file);
        //             console.log(apk_tool_download_link);
        //             console.log(`downloading: ${this.apk_tool.file} ...`);
        //             request.get(apk_tool_download_link).on('error', (e) => {
        //                 console.log(e);
        //             }).pipe(fs.createWriteStream(path.join(this.env.builder.cache, this.apk_tool.file)));
        //         }
        //
        //         // apk-signer
        //         if (!fs.existsSync(path.join(this.env.builder.cache, this.apk_signer.file))) {
        //             let apk_signer_download_link = getFileDownloadLink(this.apk_signer.user, this.apk_signer.repo, this.apk_signer.dir, this.apk_signer.file);
        //             console.log(apk_signer_download_link);
        //             console.log(`downloading: ${this.apk_signer.file} ...`);
        //             request.get(apk_signer_download_link).on('error', (e) => {
        //                 console.log(e);
        //             }).pipe(fs.createWriteStream(path.join(this.env.builder.cache, this.apk_signer.file)));
        //         }
        return 0;
        //     }
    }

    /// TODO:
    ///  - check before update or create new project
    ///  - update app name
    create(): number {
        let examplesFolder = createIfNotExist(path.join(this.env.builder.cache, '..', 'examples'));
        let exampleFilePath = path.join(examplesFolder, this.example.repo + '.zip');
        let projectPath = path.join(this.env.project.dir, this.env.project.name);
        const exampleRepoDownloadLink = getDownloadLink(this.example.user, this.example.repo);
        const exampleFolderPath = path.join(examplesFolder, this.example.repo);

        // directory is not empty
        if (fs.existsSync(projectPath)) {
            console.log(`ERROR: directory is not empty ${projectPath}`);
            process.exit();
        }

        // download example
        if (!fs.existsSync(exampleFolderPath) || this.env.force) {
            console.log('Downloading:', exampleRepoDownloadLink);

            downloadsdk({
                url: getDownloadLink(this.example.user, this.example.repo),
                repo: this.example.repo,
                targetFolder: path.join( this.env.builder.cache, '..', 'examples'),
                targetZip: path.join( this.env.builder.cache, '..', 'examples', this.example.repo + ".zip"),
                zipFolder: this.example.repo + '-master/',
                retry: 3
            }, (error)=>{
                // creating project

                if(error){
                    console.log(error);
                }else {
                    if (this.env.builder.debug)
                        console.log('Creating Project...');
                    fs.copySync(exampleFolderPath, projectPath);
                    this.updatePackageJson();
                    console.log(`$cd ${this.env.project.name}`);
                    console.log(`$npm install`);
                    console.log(`$npm run start:dev`);
                    console.log(`$npm run build`);
                }
            });
        }else {
            if (this.env.builder.debug)
                console.log('Creating Project...');
            fs.copySync(exampleFolderPath, projectPath);
            this.updatePackageJson();
            console.log(chalk.green(`   $cd ${this.env.project.name}`));
            console.log(chalk.green(`   $npm install`));
            console.log(chalk.green(`   $npm run start:dev`));
            console.log(chalk.green(`   $npm run build`));
        }
        return 0;
    }


    updatePackageJson() {
        let projectPath = path.join(this.env.project.dir, this.env.project.name);

        /// generating package.json
        const _package = require(path.join(projectPath, 'package.json'));
        _package.name = this.env.project.name;
        _package['app-name'] = this.env.project.name;
        _package['project-type'] = this.env.project.type;
        _package['project-name'] = this.env.project.name;
        _package['scripts']['build'] = 'androidjs build';
        _package["dist-path"] = "./dist";
        // _package["screenOrientation"] = "portrait";
        _package['theme'] = {
            "fullScreen": true
        };
        fs.writeFileSync(path.join(this.env.project.dir, this.env.project.name, 'package.json'), JSON.stringify(_package, null, 4));

    }

    downloadSDK(callback, force:boolean=false) {
        const sdkZip = path.join(this.env.builder.cache, this.sdk.repo + '.zip');
        const sdkFolder = path.join(this.env.builder.cache, this.sdk.repo);


        if ( !force && fs.existsSync(sdkFolder)) {
            callback();
        } else {
            downloadsdk({
                url: getDownloadLink(this.sdk.user, this.sdk.repo),
                repo: this.sdk.repo,
                targetFolder: this.env.builder.cache,
                targetZip: sdkZip,
                zipFolder: this.sdk.repo + '-master/',
                retry: 4
            }, callback);
        }


        //
        // if (fs.existsSync(sdkZip)) {
        //     // checking if the sdk file is extracted or not
        //     if(!fs.existsSync(path.join(sdkFolder, this.sdk.repo))) {
        //         try{
        //             let zip = new admZip(sdkZip);
        //             if(fs.existsSync(path.join(sdkFolder, this.sdk.repo + '-master'))){
        //                 fs.removeSync(path.join(sdkFolder, this.sdk.repo + '-master'), {recursive: true});
        //             }
        //             zip.extractEntryTo(this.sdk.repo + '-master/', sdkFolder, true, true);
        //             fs.renameSync(path.join(sdkFolder, this.sdk.repo + '-master'), path.join(sdkFolder, this.sdk.repo));
        //         }
        //         catch(e) {
        //             console.log(chalk.red('Invalid file format'), sdkZip);
        //         }
        //     }
        //     // skip if force command is not enabled
        //     if (!this.env.force) {
        //         callback();
        //         return;
        //     }
        // }
        //
        // console.log("Downloading Androidjs-SDK:", getDownloadLink(this.sdk.user, this.sdk.repo));
        // downloadGithubRepo(this.sdk, sdkZip, (error) => {
        //     if (error) {
        //         console.log('Failed to download sdk');
        //         process.exit();
        //     } else {
        //         try {
        //             let zip = new admZip(sdkZip);
        //             zip.extractEntryTo(this.sdk.repo + '-master/', sdkFolder, true, true);
        //             fs.renameSync(path.join(sdkFolder, this.sdk.repo + '-master'), path.join(sdkFolder, this.sdk.repo));
        //             callback();
        //         } catch (e) {
        //             console.log("Failed to extract sdk");
        //             console.log(chalk.red("Retry using '--force' command"));
        //             console.log("$ androidjs build --force");
        //             process.exit();
        //         }
        //     }
        // });
    }

    updateFiles(callback) {
        const sdkZip = path.join(this.env.builder.cache, this.sdk.repo + '.zip');
        const sdkFolder = path.join(this.env.builder.cache, this.sdk.repo);
        const assetsFolder = path.join(sdkFolder, 'assets');
        const myappFolder = path.join(assetsFolder, 'myapp');


        // reading package.json
        try {
            this.env.project.package = require(path.join(this.env.project.dir, 'package.json'));
        } catch (e) {
            console.log(`failed to load package:`, e.message);
            process.exit();
        }

        try {
            // creating myapp folder
            if (!fs.existsSync(assetsFolder)) {
                fs.mkdirSync(assetsFolder);
                fs.mkdirSync(myappFolder);
            } else {
                fs.removeSync(myappFolder);
                fs.mkdirSync(myappFolder);
            }
        } catch (e) {
            if (!fs.existsSync(sdkFolder)) {
                console.log(chalk.red('Can not find ' + sdkFolder));
                console.log("Try using '--force' command");
                console.log("$ androidjs build --force");
            } else {
                console.log("Failed to create assets", e);
            }
            process.exit();
        }

        // copy assets
        try {
            console.log('copying assets ...');
            fs.copySync(this.env.project.dir, myappFolder);

        } catch (e) {
            console.log(`failed to copy assets:`, e);
            process.exit();
        }

        // removing dist folder from copied filed if exist.
        if(fs.existsSync(path.join(myappFolder, 'dist'))){
            fs.removeSync(path.join(myappFolder, 'dist'))
        }

        // adding permissions
        let permissions = [];
        if (this.env.project.package.permission) {
            permissions = [
                ///... add default
                ///......................
                ...this.env.project.package.permission
            ];
        }

        let deep_links: Array<Interfaces.IDeepLink> = [];
        if (this.env.project.package["deep-link"]) {
            deep_links = [
                ///... add default
                ///......................
                ...this.env.project.package["deep-link"]
            ];
        }

        // Screen Orientation
        let screenOrientation = this.env.project.package['screenOrientation'] || null;

        // updating icon
        updateIcon(this.env, this);

        // updating app name
        updateAppName(this.env, this);

        // generate Android Manifest file
        const manifestFileData = getManifest(this.env, this, permissions, deep_links, screenOrientation);
        fs.writeFileSync(path.join(sdkFolder, 'AndroidManifest.xml'), manifestFileData);


        /**
         * Downloading Build Tools
         **/
        callback();
    }

    rebuildApk(callback) {
        const progress = new LoadingBar();

        const apkToolLink = getFileDownloadLink(this.apk_tool.user, this.apk_tool.repo, this.apk_tool.dir, this.apk_tool.file);
        const apkToolFilePath = path.join(this.env.builder.dir, '..', 'build_tools', this.apk_tool.file);
        const apkSignerLink = getFileDownloadLink(this.apk_signer.user, this.apk_signer.repo, this.apk_signer.dir, this.apk_signer.file);
        const apkSignerFilePath = path.join(this.env.builder.cache, this.apk_signer.file);
        const sdkFolderPath = path.join(this.env.builder.cache, this.sdk.repo);
        const cacheFolderPath = this.env.builder.cache;
        const buildApkFilePath = path.join(this.env.builder.cache, this.env.project.package.name + '.apk');

        let sdkConfig:any = {};
        try {
            sdkConfig = require(path.join(sdkFolderPath, 'config.json'));
        }catch (e) {
            ///..
        }

        // build tools can be used from the builder itself
        // if(!fs.existsSync(apkToolFilePath)){
        //     fs.copyFileSync(path.join(this.env.builder.dir, '..', 'build_tools', this.apk_tool.file), apkToolFilePath)
        // }


        let args_ = ['-jar', apkToolFilePath, 'b', sdkFolderPath, '-o', buildApkFilePath, '--frame-path', cacheFolderPath];
        const proc = spawn('java', args_, {cwd: cacheFolderPath});


        if(sdkConfig.version){
            console.log(`Using SDK: ${sdkConfig.version}`);
        }
        console.log("Building Apk ...");
        try {

            proc.stdout.on('data', data => {
                if (progress.isRunning === false) {
                    if (this.env.builder.debug) {
                        console.log("Build process started:");
                    }
                    progress.message = 'building ...';
                    progress.start();
                } else {
                    progress.chunksDownloaded = (parseInt(progress.chunksDownloaded) + 1).toString();
                }
            });

            proc.stderr.on('data', (data) => {
                /// no need to show any error since user will get an error after build failed
                // progress.stop({message: `failed to build apk ${data}`});
                // if (data.toString().indexOf('fakeLogOpen(/dev/log_crash) failed') != -1) {
                //     console.log("Invalid sdk files, try using '--force' command");
                // } else {
                //     console.log(chalk.red(`${data}`));
                // }
                // process.exit();
            });

            proc.on('close', (code) => {
                if (code === 0) {
                    progress.stop();
                    progress.clear();
                    callback();
                } else {
                    progress.stop({message: 'non zero exit code: failed to build apk'});
                    process.exit();
                }
            });
        } catch (e) {
            console.log("Hii");
        }
    }

    /// this function is no longer required
    // downloadBuildTools(callback) {
    //     const apkToolLink = getFileDownloadLink(this.apk_tool.user, this.apk_tool.repo, this.apk_tool.dir, this.apk_tool.file);
    //     const apkToolFilePath = path.join(this.env.builder.cache, this.apk_tool.file);
    //     const apkSignerLink = getFileDownloadLink(this.apk_signer.user, this.apk_signer.repo, this.apk_signer.dir, this.apk_signer.file);
    //     const apkSignerFilePath = path.join(this.env.builder.cache, this.apk_signer.file);
    //
    //     if (fs.existsSync(apkToolFilePath)) {
    //         if (!this.env.force) {
    //             callback();
    //             return;
    //         }
    //     }
    //
    //     console.log("Downloading BuildTools:");
    //
    //     // download build tools
    //     if (!fs.existsSync(apkToolFilePath)) {
    //         console.log(apkToolLink);
    //         downloadGithubFile(this.apk_tool, apkToolFilePath, (error) => {
    //             if (error) {
    //                 console.log("Failed to download apk-tool");
    //                 process.exit();
    //             } else {
    //                 console.log(apkSignerLink);
    //                 downloadGithubFile(this.apk_signer, apkSignerFilePath, (error) => {
    //                     if (error) {
    //                         console.log("Failed to download apk-tool");
    //                         process.exit();
    //                     } else {
    //                         callback();
    //                     }
    //                 });
    //             }
    //         });
    //     } else {
    //         console.log(apkSignerLink);
    //         downloadGithubFile(this.apk_signer, apkSignerFilePath, (error) => {
    //             if (error) {
    //                 console.log("Failed to download apk-tool");
    //                 process.exit();
    //             } else {
    //                 callback();
    //             }
    //         });
    //     }
    // }

    build(): number {
        // required paths
        const sdkZip = path.join(this.env.builder.cache, this.sdk.repo + '.zip');
        const sdkFolder = path.join(this.env.builder.cache, this.sdk.repo);
        const assetsFolder = path.join(sdkFolder, 'assets');
        const myappFolder = path.join(assetsFolder, 'myapp');
        const projectDistFolderPath = path.join(this.env.project.dir, 'dist');


        // check Java version
        javaVersion((error, home) => {
            if (error) {
                console.log(error.message);
                process.exit();
            } else {
                this.downloadSDK(() => {
                    // this.downloadBuildTools(() => {
                    this.updateFiles((error) => {
                        updateTheme(this.env, (err) => {
                            this.rebuildApk((error) => {
                                this.sign(() => {
                                    try {
                                        // checking if user defined the dist path
                                        if (this.env.project.package['dist-path']) {
                                            let dist = this.env.project.package['dist-path'];
                                            if (dist[0] === '.') {
                                                dist = path.join(this.env.project.dir, dist);
                                            }
                                            if (!fs.existsSync(dist)) fs.mkdirSync(dist);
                                            fs.copyFileSync(path.join(this.env.builder.cache, this.env.project.package.name + '-aligned-debugSigned.apk'), path.join(dist, this.env.project.package.name + '.apk'));
                                        } else {
                                            if (!fs.existsSync(projectDistFolderPath)) fs.mkdirSync(projectDistFolderPath);
                                            fs.copyFileSync(path.join(this.env.builder.cache, this.env.project.package.name + '-aligned-debugSigned.apk'), path.join(projectDistFolderPath, this.env.project.package.name + '.apk'));
                                        }
                                        // check if internet is available
                                        getUpdateMessage();
                                    } catch (e) {
                                        console.log("failed to move apk to dist folder");
                                        process.exit();
                                    }
                                });
                            });
                        });
                    });
                });

                // });
            }

        });
        return 0;
    }


    /// TODO: check this function

    sign(callback) {
        const progress = new LoadingBar();

        let apksigner_path: string = path.join(this.env.builder.dir, '..', 'build_tools', this.apk_signer.file);
        let apk_file_path = path.join(this.env.builder.cache, this.env.project.package.name + '.apk');
        let build_working_dir = path.join(this.env.builder.cache);

        let args_: Array<string> = ['-jar', apksigner_path, '--apks', apk_file_path, '--debug'];

        // @ts-ignore
        const proc = spawn('java', args_, {cwd: build_working_dir});
        proc.stdout.on('data', data => {
            if (progress.isRunning === false) {
                progress.message = 'signing ...';
                progress.start();
            } else {
                progress.chunksDownloaded = (parseInt(progress.chunksDownloaded) + 1).toString();
            }
        });

        proc.stderr.on('data', (data) => {
            progress.stop({message: 'error on signing apk'});
            if (this.env.builder.debug) {
                console.log(`${data}`);
            }
            process.exit();
        });

        proc.on('close', (code) => {
            if (code === 0) { // process exit successfully
                progress.stop();
                callback();
            } else {
                progress.stop({message: "failed to sign apk", code});
                process.exit(); // exit process instead of invoking callback
            }

        });
    }

    // extractSKD(callback) {
    //
    //     let zip = new admZip(path.join(this.env.builder.cache, this.sdk_repo + '.zip'));
    //     zip.extractEntryTo(this.sdk_repo + '-master/', this.env.builder.cache);
    //
    //     // removing previous sdk folder before updating new sdk folder
    //     if (fs.existsSync(this.sdk)) {
    //         fs.removeSync(this.sdk);
    //     }
    //     fs.renameSync(path.join(this.env.builder.cache, this.sdk_repo + '-master'), this.sdk);
    //
    // }
}


interface downloadGithubArgs {
    url: string
    targetZip: string
    repo: string
    targetFolder: string
    zipFolder: string
    retry: number
}

interface IGithubRepoLink {
    user: string
    repo: string
}

function downloadsdk(args: downloadGithubArgs, callback) {
    args.retry -= 1;
    let state = {
        data: 0,
        moveCursor: false,
        responseCode: null,
        fileStream: fs.createWriteStream(args.targetZip),
        progress: new LoadingBar()
    };
    request
        .get({url: args.url, headers: {'User-Agent': 'request'}})
        .on('response', response => {
            state.responseCode = response.statusCode;
            if (response.statusCode === 200) {
                //@ts-ignore
                if(args.recursive){
                    console.log(`re-trying`);
                    state.progress.message = "Downloading:";
                    state.progress.start();
                }else {
                    console.log("Downloading:", args.url);
                    state.progress.message = "Downloading:";
                    state.progress.start();
                }
            }
        })
        .on('data', data => {
            state.data += data.length;
            state.progress.chunksDownloaded = `${Math.floor(state.data * 0.001)} KB`;
            state.progress.message = `Data: `;
        })
        .on('error', error => {
            if(state.responseCode === null){
                console.log(`Failed to download: ${args.url},\nCheck your internet connection`);
                // console.log(chalk.green(`You can manually update Androidjs-sdk by downloading from: \n[${args.url}] \nand extracting it to: [${path.join(args.targetFolder, args.repo)}]`));
            } else {
                state.progress.stop({message: `Failed to download: ${args.url}`});
                console.log(error);
            }
        })
        .on('end', () => {
            state.fileStream.close();
            try {
                let zip = new admZip(args.targetZip);
                if (fs.existsSync(path.join(args.targetFolder, args.zipFolder))) {
                    fs.removeSync(path.join(args.targetFolder, args.zipFolder));
                }
                zip.extractEntryTo(args.zipFolder, args.targetFolder, true, true);
                if (fs.existsSync(path.join(args.targetFolder, args.repo))) {
                    fs.removeSync(path.join(args.targetFolder, args.repo));
                }
                fs.renameSync(path.join(args.targetFolder, args.zipFolder), path.join(args.targetFolder, args.repo));
                state.progress.stop();
                callback();
            } catch (e) {
                if (args.retry > 0) {
                    state.progress.stop({message: "failed to download, retrying.."});
                    //@ts-ignore
                    downloadsdk({...args, recursive: true}, callback);
                } else {
                    state.progress.stop({message: "failed to download"});
                    callback({message: "failed to download"});
                }
            }
        })
        .pipe(state.fileStream);
}
