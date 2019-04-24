const path = require('path');
const fs = require('fs');
const {copyDir} = require('./copyDir');
const {spawn} = require('child_process');


const {copyApkCore} = require('../lib/copyApkCore');
const {updateAndroidManifest} = require('../lib/updateAndroidManifest');
const {updateAppName} = require('../lib/updateAppName');
const {updateIcon} = require('../lib/updateIcon');



const commands = {
    apktool: path.join(__dirname, '..', 'bin', 'build_tools', 'apktool.jar'),
    signer: path.join(__dirname, '..', 'bin', 'build_tools', 'uber-apk-signer-1.0.0.jar')
};


async function buildApk(args) {

    await copyApkCore(args);
    console.log("Core Modules Copied !");

    await copyUserApp(args);
    console.log("User data copied");

    await updateAndroidManifest(args);
    console.log("AndroidManifest updated!");

    await updateAppName(args);
    console.log("App Name updated!");

    await updateIcon(args);
    console.log("Icon updated!");



    await build(args);
    console.log("Build finished!");

    sign(args);

}


function copyUserApp (args) {
    return new Promise((resolve, reject) => {
        copyDir(args.PROJECT__cwd, path.join(args.PROJECT__dist, 'app-debug', 'assets', 'myapp'), [
            args.PROJECT__dist
        ]).then(()=> {
            console.log('copying user app done.')
            resolve(0);
        }).catch(e => {
            console.log('ERROR: while copying user app', e);
        });
    });
}

function build(args) {

    return new Promise((resolve, reject) => {

        console.log('Building...');

        let args_ = ['-jar', commands.apktool, 'b', path.join(args.PROJECT__dist, 'app-debug'), '-o', path.join(args.PROJECT__dist, 'app.apk')];
        const proc = spawn('java', args_, {cwd: args.PROJECT__dist});
        proc.stdout.on('data', data => {
            console.log(`${data}`);
        });

        proc.stderr.on('data', (data) => {
            // console.log("ERROR: failed to build .apk");
            // console.log(`stderr: ${data}`);
            // reject(1);
        });

        proc.on('close', (code) => {
            console.log(`build process exited with code ${code}`);
            resolve(`${code}`);
        });
    });


}


function sign(args) {
	console.log('Sign apk');
	let args_ = ['-jar', commands.signer, '--apks', path.join(args.PROJECT__dist, 'app.apk'), '--debug'];

	const proc = spawn('java', args_, {cwd: args.PROJECT__dist});
	proc.stdout.on('data', data => {
		console.log(`${data}`);
	});

	proc.stderr.on('data', (data) => {
		console.log(`stderr: ${data}`);
	});

	proc.on('close', (code) => {
		console.log(`sign process exited with code ${code}`);
	});

}


module.exports = {
    buildApk
};
