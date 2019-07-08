const path = require('path');
const {spawn} = require('child_process');
const fs = require('fs-extra');
const {signAPK} = require('./sign_apk');
const chalk = require("chalk");


function buildAPK(androidjs) {
    console.log('Building APK');

    // apk tool path
    let apktool_path = androidjs.builder.paths.apktool;

    // androidjs-SDK path
    let app_debug_path = path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo);

    // cache directory
    let cache_path = path.join(androidjs.builder.paths.dist, 'cache');

    // output final signed apk into cache directory
    let output_file_path = path.join(androidjs.builder.paths.dist, 'cache', 'app.apk');

    let args_ = ['-jar', apktool_path, 'b', app_debug_path, '-o', output_file_path, '--frame-path', cache_path];
    let build_working_dir = path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo);

    const proc = spawn('java', args_, {cwd: build_working_dir});

    proc.stdout.on('data', data => {
        console.log(`${data}`);
    });

    proc.stderr.on('data', (data) => {
        console.log("ERROR: failed to build .apk");
        console.log(`stderr: ${data}`);
    });

    proc.on('close', (code) => {
        console.log(`build process exited with code ${code}`);
        if (code === 0) signAPK(androidjs);
    });
}

module.exports = {
    buildAPK
};