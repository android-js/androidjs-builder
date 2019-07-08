const listContent = require('list-github-dir-content');
const request = require('request');
const fs = require('fs-extra');
const fx = require('mkdir-recursive');
const path = require('path');
const chalk = require("chalk");
const Spinner = require('cli-spinner').Spinner;
const copydir = require('copy-dir');



Array.prototype.contains = function (element) {
    return this.indexOf(element) > -1;
};

function copyDir(__src, __dest, filters) {
    return new Promise((resolve, reject) => {
        console.log(filters);
        copydir.sync(__src, __dest, function (stat, filepath, filename) {
            if (filters.contains(filepath))
                return false;
            else
                return true;

        }, function (err) {
            throw "ERROR: failed to copy\n";
        });
        resolve(0);
    });
}


// const github_row_data_link = 'https://raw.githubusercontent.com/DeveshPankaj/androidjs-core/master/README.md'

function getGithubDirList(config, filepath) {

    return new Promise((resolve, reject) => {

        const filesArray = listContent.viaTreesApi(config.github.username + '/' + config.github.repo, filepath);
        filesArray.catch(err => {
            console.log("invalid github url");
            console.log("Failed to connect to GitHub");
            console.log("Check Your InterNet Connection\n\n\n");
            reject(err);
        });

        filesArray.then(data => {
            console.log(data);
            resolve(data);
        });

    });
}


let Copy = class {

    constructor(debug = false) {
        this.debug = debug;
    }

    fromGithub(config, filepath) {
        this.temp = {};
        this.temp.config = config;

        let spinner = new Spinner(`Downloading ... %s ${chalk.green('')} `);
        // spinner.setSpinnerString('|/-\\');
        // spinner.setSpinnerString('⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏');
        spinner.setSpinnerString('⠁⠂⠄⡀⢀⠠⠐⠈');
        // spinner.setSpinnerString('← ↖ ↑ ↗ → ↘ ↓ ↙');
        // spinner.setSpinnerString('▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▇ ▆ ▅ ▄ ▃ ▁');

        this.temp.row_data_link = this.github_row_data_link(config, filepath);
        this.temp.to = (to, resolve) => {
            console.log(chalk.green(`Downloading Sample Project From:`));
            console.log(chalk.yellow(`${this.temp.row_data_link}`));
            spinner.start();

            // get the directory tree
            let response = getGithubDirList(this.temp.config, filepath);
            response.then(tree => {

                let i = 0;
                let j = tree.length;
                let k = 0;
                // copy each file to local-directory
                tree.forEach(e => {

                    let link = this.github_row_data_link(config, e);
                    k++;
                    // spinner.setSpinnerTitle(chalk.green(`${k}/${j}`+chalk.blue(' %s ')+chalk.green(`${e}`)));
                    // if (this.debug) {
                    //     console.log(`Copying: ${link}`);
                    // } else {
                    //     console.log(`Copying: ${e}`);
                    // }

                    // Build path
                    // e = e.replace(filepath + '/', '');
                    fx.mkdirSync(path.join(to, path.dirname(e)));
                    // if(! fs.existsSync(path.join(to, e))) {

                        request(link, () => {
                            i++;
                            spinner.onTick(chalk.green(`${i}/${j} ✔ ${e}\n`));
                            spinner.setSpinnerTitle(`${j-i} %s files remain`);

                            // if (this.debug)
                                // spinner.onTick(chalk.yellow(`( ${j - i}/ ${j} ) downloading `) + `${e}\n`);
                            // console.log(chalk.yellow(`( ${j-i}/ ${j} ) downloading `)+`Downloading: ${e}\nto: ${path.join(to, e)}`);

                            // stop the spinner in last file download
                            if (i === j) {
                                spinner.stop(1);
                                if(resolve)resolve(0);
                            }

                            // Download file
                        }).pipe(fs.createWriteStream(path.join(to, e)));
                    // }else{
                    //     i--;
                    // }
                });


            });
        };
        return this.temp;
    };

    fromSystem(config, filepath) {

        this.temp = {};
        this.temp.row_data_link = filepath;
        this.config = config;
        this.temp.to = (to, resolve) => {
            this.temp.to = to;
            console.log(`copying from ${this.temp.row_data_link} \nto: ${to}`);
            fx.mkdirSync(to);
            copyDir(this.temp.row_data_link, this.temp.to, this.config.filters).then(()=>resolve(0));
        };

        return this.temp;
    }

    github_row_data_link(config, filepath) {
        return `https://raw.githubusercontent.com/${config.github.username}/${config.github.repo}/${config.github.branch}/${filepath}`;
    }
};


// let cp = new Copy();
// will move this config to ./react_app.js
// const config = {
//     username: 'DeveshPankaj',
//     repo: 'sample-app',
//     branch: 'master'
// };

// const filepath = 'react-native';
// cp.fromGithub(config, filepath).to('./');
// cp.fromSystem({}, '/home').to('~/Desktop');


module.exports = {
    Copy
};