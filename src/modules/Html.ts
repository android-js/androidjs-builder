import '../Interfaces';
import {Interfaces} from '../Interfaces';
import * as request from 'request';
import * as path from 'path';
import {lsGit, getDownloadLink, getFileDownloadLink} from '../GitListDir';
import IPackage = Interfaces.IPackage;
import * as fs from 'fs-extra';
import {spawn} from 'child_process';
import {getManifest} from './Html/ManifestBuilder';
import {updateIcon} from './Html/updateIcon';
import {updateAppName} from './Html/updateAppName';
import {Command} from 'commander';
import {downloadSDK} from './Html/downloadSDK';
import {createIfNotExist} from './Html/createIfNotExist';
import {downloadGithubFile} from './Html/downloadGithubFile';
import {downloadGithubRepo} from './Html/downloadGithubRepo';
import {LoadingBar, ProgressBar} from './Html/ProgressBar';
import {javaVersion} from './Html/getJavaVersion';
import {getUpdate, getUpdateMessage} from './Html/checkForUpdates';
import {updateTheme} from "./Html/updateAppTheme";

const chalk = require('chalk');

const admZip = require('adm-zip');


/**
 * Html module for creating HTML based Android-Js project
 */
export class Html implements Interfaces.IBuilderModule {
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
        this.context.updateSdk = ()=>require('./Html/updateSdk').updateSdk(this.env);
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
        const exampleFolderPath = path.join(examplesFolder, this.example.repo + '-master');

        // directory is not empty
        if (fs.existsSync(projectPath)) {
            console.log(`ERROR: directory is not empty ${projectPath}`);
            process.exit();
        }

        // download example
        if (!fs.existsSync(exampleFolderPath) || this.env.force) {
            console.log('Downloading:', exampleRepoDownloadLink);
            downloadGithubRepo(this.example, exampleFilePath, (error) => {
                if (error) {
                    console.log('Failed to download', error);
                    process.exit();
                }
                // extract in examples folder
                try {
                    let zip = new admZip(exampleFilePath);
                    zip.extractEntryTo(this.example.repo + '-master/', examplesFolder, true, true);
                } catch (e) {
                    console.log("Failed to extract", exampleFilePath);
                    console.log("Retry using '-f' flag");
                    /// TODO:
                    ///     - failed to download file
                    fs.unlinkSync(exampleFilePath);
                    process.exit();
                }

                // creating project
                if (this.env.builder.debug)
                console.log('Creating Project...');
                fs.copySync(exampleFolderPath, projectPath);
                this.updatePackageJson();
                console.log(`$cd ${this.env.project.name}`);
                console.log(`$npm install`);
                console.log(`$npm run start:dev`);
                console.log(`$npm run build`);
            });
        }


        // if example exist in cache
        else {
            // creating project
            console.log('Creating Project...');
            fs.copySync(exampleFolderPath, projectPath);
            this.updatePackageJson();
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
        _package['scripts']['build'] = 'androidjs build';
        _package["dist-path"] = "./dist";
        _package['theme'] = {
            "fullScreen": true
        };
        fs.writeFileSync(path.join(this.env.project.dir, this.env.project.name, 'package.json'), JSON.stringify(_package, null, 4));

    }

    downloadSDK(callback) {
        const sdkZip = path.join(this.env.builder.cache, this.sdk.repo + '.zip');
        const sdkFolder = path.join(this.env.builder.cache);

        if (fs.existsSync(sdkZip)) {
            if (!this.env.force) {
                callback();
                return;
            }
        }

        console.log("Downloading Androidjs-SDK:", getDownloadLink(this.sdk.user, this.sdk.repo));
        downloadGithubRepo(this.sdk, sdkZip, (error) => {
            if (error) {
                console.log('Failed to download sdk');
                process.exit();
            } else {
                try {
                    let zip = new admZip(sdkZip);
                    zip.extractEntryTo(this.sdk.repo + '-master/', sdkFolder, true, true);
                    fs.renameSync(path.join(sdkFolder, this.sdk.repo + '-master'), path.join(sdkFolder, this.sdk.repo));
                    callback();
                } catch (e) {
                    console.log("Failed to extract sdk");
                    process.exit();
                }
            }
        });
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

        // creating myapp folder
        if (!fs.existsSync(assetsFolder)) {
            fs.mkdirSync(assetsFolder);
            fs.mkdirSync(myappFolder);
        } else {
            fs.rmdirSync(myappFolder, {recursive: true});
            fs.mkdirSync(myappFolder);
        }

        // copy assets
        try {
            console.log('copying assets ...');
            fs.copySync(this.env.project.dir, myappFolder);
        } catch (e) {
            console.log(`failed to copy assets:`, e.message);
            process.exit();
        }

        // removing dist folder from copied filed if exist.
        fs.rmdirSync(path.join(myappFolder, 'dist'), {recursive: true});

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

        // updating icon
        updateIcon(this.env, this);

        // updating app name
        updateAppName(this.env, this);

        // generate Android Manifest file
        const manifestFileData = getManifest(this.env, this, permissions, deep_links);
        fs.writeFileSync(path.join(sdkFolder, 'AndroidManifest.xml'), manifestFileData);


        /**
         * Downloading Build Tools
         **/
        callback();
    }

    rebuildApk(callback) {
        const progress = new LoadingBar();

        const apkToolLink = getFileDownloadLink(this.apk_tool.user, this.apk_tool.repo, this.apk_tool.dir, this.apk_tool.file);
        const apkToolFilePath = path.join(this.env.builder.cache, this.apk_tool.file);
        const apkSignerLink = getFileDownloadLink(this.apk_signer.user, this.apk_signer.repo, this.apk_signer.dir, this.apk_signer.file);
        const apkSignerFilePath = path.join(this.env.builder.cache, this.apk_signer.file);
        const sdkFolderPath = path.join(this.env.builder.cache, this.sdk.repo);
        const cacheFolderPath = this.env.builder.cache;
        const buildApkFilePath = path.join(this.env.builder.cache, this.env.project.package.name + '.apk');


        let args_ = ['-jar', apkToolFilePath, 'b', sdkFolderPath, '-o', buildApkFilePath, '--frame-path', cacheFolderPath];
        const proc = spawn('java', args_, {cwd: cacheFolderPath});

        proc.stdout.on('data', data => {
            if (progress.isRunning === false) {
                if (this.env.builder.debug) {
                    console.log("Build process started:");
                }
                progress.message = 'building ...';
                progress.start();
            } else {
                progress.chunksDownloaded++;
            }
        });

        proc.stderr.on('data', (data) => {
            // progress.stop({message: 'failed to build apk'});
            // console.log(this.env, `${data}`);
            // if(this.env.builder.debug === true){
            //     console.log(`${data}`);
            //     process.exit();
            // }else {
            //     process.exit();
            // }
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
    }

    downloadBuildTools(callback) {
        const apkToolLink = getFileDownloadLink(this.apk_tool.user, this.apk_tool.repo, this.apk_tool.dir, this.apk_tool.file);
        const apkToolFilePath = path.join(this.env.builder.cache, this.apk_tool.file);
        const apkSignerLink = getFileDownloadLink(this.apk_signer.user, this.apk_signer.repo, this.apk_signer.dir, this.apk_signer.file);
        const apkSignerFilePath = path.join(this.env.builder.cache, this.apk_signer.file);

        if (fs.existsSync(apkToolFilePath)) {
            if (!this.env.force) {
                callback();
                return;
            }
        }

        console.log("Downloading BuildTools:");

        // download build tools
        if (!fs.existsSync(apkToolFilePath)) {
            console.log(apkToolLink);
            downloadGithubFile(this.apk_tool, apkToolFilePath, (error) => {
                if (error) {
                    console.log("Failed to download apk-tool");
                    process.exit();
                } else {
                    console.log(apkSignerLink);
                    downloadGithubFile(this.apk_signer, apkSignerFilePath, (error) => {
                        if (error) {
                            console.log("Failed to download apk-tool");
                            process.exit();
                        } else {
                            callback();
                        }
                    });
                }
            });
        } else {
            console.log(apkSignerLink);
            downloadGithubFile(this.apk_signer, apkSignerFilePath, (error) => {
                if (error) {
                    console.log("Failed to download apk-tool");
                    process.exit();
                } else {
                    callback();
                }
            });
        }
    }

    build(): number {
        // required paths
        const sdkZip = path.join(this.env.builder.cache, this.sdk.repo + '.zip');
        const sdkFolder = path.join(this.env.builder.cache, this.sdk.repo);
        const assetsFolder = path.join(sdkFolder, 'assets');
        const myappFolder = path.join(assetsFolder, 'myapp');
        const projectDistFolderPath = path.join(this.env.project.dir, 'dist');


        // check Java version
        javaVersion((error, version) => {
            if(error) {
                console.log(error.message);
                process.exit();

            }else {
                this.downloadSDK(() => {
                    this.downloadBuildTools(() => {
                        this.updateFiles((error) => {
                            updateTheme(this.env, (err)=>{
                                this.rebuildApk((error) => {
                                this.sign(() => {
                                    try {

                                        // checking if user defined the dist path
                                        if(this.env.project.package['dist-path']) {
                                            let dist = this.env.project.package['dist-path'];
                                            if(dist[0] === '.') {
                                                dist = path.join(this.env.project.dir, dist);
                                            }
                                            if (!fs.existsSync(dist)) fs.mkdirSync(dist);
                                            fs.copyFileSync(path.join(this.env.builder.cache, this.env.project.package.name + '-aligned-debugSigned.apk'), path.join(dist, this.env.project.package.name + '.apk'));
                                        }else {
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

                });
            }

        });
        return 0;
    }


    /// TODO: check this function

    sign(callback) {
        const progress = new LoadingBar();

        let apksigner_path: string = path.join(this.env.builder.cache, this.apk_signer.file);
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
                progress.chunksDownloaded++;
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
    //         fs.rmdirSync(this.sdk, {recursive: true});
    //     }
    //     fs.renameSync(path.join(this.env.builder.cache, this.sdk_repo + '-master'), this.sdk);
    //
    // }
}
