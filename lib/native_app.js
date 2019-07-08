const chalk = require("chalk");
const figlet = require("figlet");
const {Copy} = require('./copy');
const {spawn} = require('child_process');
const path = require('path');
const fs = require('fs-extra');
const {buildAPK} = require('./buildAPK');
const Spinner = require('cli-spinner').Spinner;
const {updateAndroidManifest} = require('./updateAndroidManifest');
const {updateAppName} = require('./updateAppName');
const {updateIcon} = require('./updateIcon');

let Native = class {

    constructor(androidjs) {
        this.androidjs = androidjs;

        // set github repo for native app
        this.androidjs.builder.config.github.sample = this.androidjs.builder.config.github.repo.sample;
        this.androidjs.builder.config.github.repo = this.androidjs.builder.config.github.repo.native_app;

        // ignore project dist folder for copying into assets
        this.androidjs.project.config.filters = [
            path.join(this.androidjs.project.paths.__dirname, 'dist')
        ];
    }

    init() {
        console.log(`Creating Native app at ${this.androidjs.project.paths.__dirname}`);
        let copy = new Copy(this.androidjs.debug);
        let filepath = 'vue-js-example';
        let config = {...this.androidjs.builder.config};
        config.github.repo = config.github.sample;
        copy.fromGithub(config, filepath)
            .to(this.androidjs.project.paths.__dirname, ()=>{
                console.log('example downloaded');
                fs.renameSync(path.join(this.androidjs.project.paths.__dirname, filepath),
                    path.join(this.androidjs.project.paths.__dirname, this.androidjs.project.name));
            });
    }

    build() {
        copyCore(this.androidjs).then(()=>{
            copyAssets(this.androidjs).then(()=>{
                changeIcon(this.androidjs).then(() => {
                    updateConfig(this.androidjs).then(()=>{

                        buildAPK(this.androidjs);
                    });
                });
            });
        });
    }

    serve() {
        console.log('native app currently do-not supports live serve');
    }
};

function copyCore(androidjs) {
    return new Promise((resolve, reject) => {

        // console.log('checking Core');

        // fs.removeSync(androidjs.project.paths.dist);

        const copy = new Copy(androidjs.debug);

        // check androidjs-sdk
        if (fs.existsSync(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo))) {
            if (androidjs.debug)
                console.log(`using core ${path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo)}`);


            if (androidjs.debug)
                console.log(`removing ${path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo, 'assets', 'myapp')}/*`);
            fs.removeSync(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo, 'assets', 'myapp'));
            fs.removeSync(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo, 'build'));
            resolve(0);
            // copy data sample from local storage
            // copy.fromSystem(androidjs.project.config, path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo))
            //     .to(androidjs.project.paths.dist);

        } else {


            /***
            console.log('downloading core from github...');

            // download sample to the local storage
            copy.fromGithub(androidjs.builder.config, '')
                .to(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo), resolve);

            // copy data sample from local storage
            // copy.fromSystem(androidjs.project.config, path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo))
            //     .to(androidjs.project.paths.dist);

            if (androidjs.debug)
                console.log(`core downloaded at ${path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo)}`)
             */


            let spinner = new Spinner(chalk.green('downloading androidjs-sdk %s'));
            spinner.setSpinnerString('← ↖ ↑ ↗ → ↘ ↓ ↙');
            spinner.start();
            const request = require('superagent');

            let href = `https://github.com/${androidjs.builder.config.github.username}/${androidjs.builder.config.github.repo}/archive/master.zip`;

            request
                .get(href)
                .on('error', function (error) {
                    console.log(error);
                    spinner.stop();
                })
                .pipe(fs.createWriteStream(path.join(androidjs.builder.paths.cache, androidjs.builder.config.github.repo+'.zip')))
                .on('finish', function () {
                    spinner.onTick('downloaded');
                    const admZip = require('adm-zip');

                    let zip = new admZip(path.join(androidjs.builder.paths.cache, androidjs.builder.config.github.repo + '.zip'));
                    spinner.setSpinnerTitle('extracting %s');

                    zip.extractEntryTo(androidjs.builder.config.github.repo + '-master/', androidjs.builder.paths.dist);
                    console.log('zip extracted!');
                    spinner.onTick('done');
                    fs.removeSync(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo));
                    fs.renameSync(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo+'-master'), path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo));
                    spinner.stop();
                    resolve(0);
                });

        }

    });
}

function copyAssets(androidjs) {
    return new Promise((resolve, reject)=> {
        console.log('copying Assets');
        const copy = new Copy(androidjs.debug);
        copy.fromSystem(androidjs.project.config, androidjs.project.paths.__dirname)
            .to(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo, 'assets', 'myapp'), resolve);
    });
}

function changeIcon(androidjs) {
    return new Promise((resolve, reject) => {
        console.log('changing icon');
        updateIcon(androidjs).then(() => {
            console.log(chalk.green('icons Updated'));
            resolve(0);
        }).catch(e => {
            console.log(chalk.red('failed to update icons'));
            console.log(e);
            reject('failed to update icons');
        });
    })
}

function updateConfig(androidjs){
    return new Promise((resolve, reject) =>{
        console.log('changing configuration');
        // updating AndroidManifest , adding permissions
        updateAndroidManifest(androidjs).then(()=>{

            // updating app name, changing values
            updateAppName(androidjs).then(()=>resolve(0)).catch(e => {
                console.log('failed to update app name');
            });
        }).catch((e)=>{
            console.log('failed to update AndroidManifest');
            console.log(e);
            reject(e);
        });
    });
}


module.exports = {
    Native
};
