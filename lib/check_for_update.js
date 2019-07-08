const semver = require('semver');
const fs = require('fs-extra');
const request = require('request');
const path = require('path');
const chalk = require("chalk");

const jsonfile = require('jsonfile');


function github_row_data_link(androidjs) {
    return `https://raw.githubusercontent.com/${androidjs.builder.config.github.username}/${androidjs.builder.config.github.repo.native_app}/master/config.json`;
}

function checkForUpdate(androidjs) {

    // check for update only if the user is using androidjs-sdk
    if(fs.existsSync(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo.native_app))) {

        const internetAvailable = require("internet-available");
        internetAvailable({
            domainName: "github.com",
            port: 53,
            host: '8.8.8.8'
        }).then(() => {
            let new_config = jsonfile.readFileSync(path.join(androidjs.builder.paths.cache, 'config.json'));
            let old_config = jsonfile.readFileSync(path.join(androidjs.builder.paths.dist, 'androidjs-sdk', 'config.json'));

            // if old version is less then new version
            if(semver.lt(old_config.version, new_config.version)){
                console.log(chalk.yellow(`your are using androidjs-sdk ${old_config.version}`)+ chalk.red(' < ') + chalk.green(new_config.version)+chalk.yellow(' is available'));
                console.log(chalk.green(`run 'androidjs update' for update`));
            }

            request(github_row_data_link(androidjs)).pipe(
                fs.createWriteStream(path.join(androidjs.builder.paths.cache, 'config.json'))
            );

        }).catch((e) => {
            console.log(e);
            console.log('failed to connect');
        });

    }
}

module.exports = {
    checkForUpdate
};


