const path = require('path');
const {spawn} = require('child_process');
const fs = require('fs-extra');
const chalk = require("chalk");


function signAPK(androidjs) {
    console.log('sign apk');

    let apksigner_path = androidjs.builder.paths.apksigner;
    let apk_file_path = path.join(androidjs.builder.paths.dist, 'cache', 'app.apk');
    let build_working_dir = path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo);

    let args_ = ['-jar', apksigner_path, '--apks', apk_file_path, '--debug'];

    const proc = spawn('java', args_, {cwd: build_working_dir});
    proc.stdout.on('data', data => {
        console.log(`${data}`);
    });

    proc.stderr.on('data', (data) => {
        console.log(`stderr: ${data}`);
    });

    proc.on('close', (code) => {
        console.log(`sign process exited with code ${code}`);
        if (code === 0) {
            console.log("apk signed");

            // copy signed apk to project directory
            fs.copy(path.join(androidjs.builder.paths.dist, 'cache', 'app-aligned-debugSigned.apk'), path.join(androidjs.project.paths.__dirname, 'dist', 'app.apk'))
                .then(() => {
                    console.log('success! compiled');

                    // install apk in emulator
                    if (androidjs.install === true) {
                        console.log(chalk.yellow('installing ...'));
                        let install = spawn('adb', ['install', '-r', path.join(androidjs.project.paths.__dirname, 'dist', 'app.apk')], {cwd: build_working_dir});
                        install.stdout.on('data', data => {
                            console.log(`${data}`);
                        });

                        install.stderr.on('data', (data) => {
                            console.log(`stderr: ${data}`);
                        });

                        install.on('close', (code) => {
                            console.log(`Install status ${code}`);
                        });
                    }
                }).catch(err => console.error(err));

        }
    });
}

module.exports = {
    signAPK
};
