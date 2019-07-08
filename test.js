#!/usr/bin/env node

const inquirer = require("inquirer");
const chalk = require("chalk");
const figlet = require("figlet");
const shell = require("shelljs");
const fs = require('fs-extra');
const os = require('os');
const program = require('commander');
const path = require('path');
const {React} = require('./lib/react_app');
const {Native} = require('./lib/native_app');

const pkg = require('./package');
const {init_builder} = require('./lib/init_builder');
const Spinner = require('cli-spinner').Spinner;
const jsonfile = require('jsonfile');
const {Copy} = require('./lib/copy');
const {checkForUpdate} = require('./lib/check_for_update');


// const center = require('center-align');
// const npm = require('npm');

const init = () => {
    console.log(
        chalk.green(
            figlet.textSync("Android JS", {
                font: "Big",
                horizontalLayout: "default",
                verticalLayout: "default"
            })
        )
    );
};

var androidjs = {
    debug: true,

    name: pkg.name,
    version: pkg.version,

    // project information
    project: {
        paths: {
            __dirname: process.cwd(),
            dist: path.join(process.cwd(), 'dist')
        },
        config: {}
    },

    // builder
    builder: {
        paths: {
            __dirname: __dirname,
            build_tools: path.join(__dirname, 'build_tools'),
            apktool: path.join(__dirname, 'build_tools', 'apktool.jar'),
            apksigner: path.join(__dirname, 'build_tools', 'uber-apk-signer-1.0.0.jar'),
            dist: path.join(process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE, '.androidjs'),
            cache: path.join(process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE, '.androidjs', 'cache'),
            config: path.join(process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE, '.androidjs', 'config')
        },
        config: {
            github: {
                username: 'android-js',
                repo: {
                    builder: 'androidjs-builder',
                    native_app: 'androidjs-sdk',
                    react_app: 'androidjs-core-react-native',
                    sample: 'sample-app'

                },
                branch: 'master',
            }
        }
    }
};


init_builder(androidjs);
loadConfig(androidjs);
checkForUpdate(androidjs);

// console.log(androidjs);


// androidjs.project = {};
// androidjs.builder = {};
// androidjs.project.paths = {};
// androidjs.builder.paths = {};

// androidjs.project.paths.__dirname = process.cwd();
// androidjs.builder.paths.__dirname = __dirname;


// console.log(androidjs)

const askQuestions = () => {
    const questions = [{
        name: "APPNAME",
        type: "input",
        message: "Application name:"
    },
        {
            type: "list",
            name: "APPTYPE",
            message: "Project type:",
            choices: [
                // chalk.yellow("React"),
                // chalk.green("Flutter"),
                "HTML/CSS"
            ],
            // filter: function (val) {
            //     return val.split(".")[1];
            // }
        }
    ];
    return inquirer.prompt(questions);
};


const run = async () => {
    // init();

    const ans = await askQuestions();
    const {APPNAME, APPTYPE} = ans;
    // console.log(`Creating project at ${androidjs.project.paths.__dirname}`);

    if (APPTYPE === chalk.yellow("React")) {
        const r = new React(androidjs);
        r.init();
    } else if (APPTYPE === "HTML/CSS") {
        androidjs.project.name = APPNAME;
        const n = new Native(androidjs);
        n.init();
    } else {
        console.trace(chalk.red(`Error from :${__filename}: [App Under Development]`));
    }

    // r.build();

};


// run();


program
    .version(pkg.version)
    .description(chalk.red(`${androidjs.name} requires JRE version  > 1.8.0 \nwhich can be found here https://filehippo.com/download_jre_64/`))
    .option('-u, --update ', `update ${androidjs.name}`)
    .action((env) => {
        console.log(env)
    });

program
    .command('update')
    .alias('u')
    .description(chalk.yellow('update androidjs packages'))
    .action(env => {

        console.log(chalk.green('updating ... '));

        let spinner = new Spinner(chalk.green('downloading androidjs-sdk %s'));
        spinner.setSpinnerString('▁▂▃▄▅▆▇█▇▆▅▄▃▂▁');
        spinner.start();
        const request = require('superagent');

        let config = {...androidjs.builder.config.github};
        config.github.repo = androidjs.builder.config.github.repo.native_app;

        let href = `https://github.com/${config.github.username}/${config.github.repo}/archive/master.zip`;

        request
            .get(href)
            .on('error', function (error) {
                console.log(error);
                spinner.stop();
            })
            .pipe(fs.createWriteStream(path.join(androidjs.builder.paths.cache, androidjs.builder.config.github.repo.native_app+'.zip')))
            .on('finish', function () {
                spinner.onTick('downloaded');
                const admZip = require('adm-zip');

                let zip = new admZip(path.join(androidjs.builder.paths.cache, androidjs.builder.config.github.repo.native_app + '.zip'));
                spinner.setSpinnerTitle('extracting %s');

                zip.extractEntryTo(androidjs.builder.config.github.repo.native_app + '-master/', androidjs.builder.paths.dist);
                console.log('zip extracted!');
                spinner.onTick('done');
                fs.removeSync(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo.native_app));
                fs.renameSync(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo.native_app+'-master'), path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo.native_app));
                spinner.stop();

            });

        // fs.mkdirSync(path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo.native_app));



        /*
        const Spinner = require('cli-spinner').Spinner;
        let msg = 'checking internet connection ... ';
        let spinner = new Spinner(chalk.blue( msg + '%s'));
        // spinner.setSpinnerString('⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏');
        spinner.setSpinnerString('← ↖ ↑ ↗ → ↘ ↓ ↙');
        spinner.start();

        const internetAvailable = require("internet-available");
        internetAvailable({
            domainName: "github.com",
            port: 53,
            host: '8.8.8.8'
        }).then(() => {
            spinner.onTick(chalk.blue(msg)+chalk.green('✔')+'\n');
            spinner.onTick(chalk.blue('connected to github\n'));
            spinner.setSpinnerTitle(`updating sdk ... %s`);

            // spinner.setSpinnerTitle(chalk.blue( msg + '%s'));
            const copy = new Copy(androidjs.debug);
            let config = {...androidjs.builder.config};
            config.github.native_app = config.github.repo.native_app;
            config.github.repo = config.github.repo.native_app;

            copy.fromGithub(config, '')
                .to(path.join(androidjs.builder.paths.dist, config.github.native_app), ()=>{
                    spinner.setSpinnerTitle(`%s installing sdk`);
                    spinner.stop();
                });
            // spinner.stop();


        }).catch((e) => {
            spinner.onTick(chalk.blue(msg)+chalk.red('✘')+'\n');
            spinner.onTick(chalk.blue('failed to connect to github\n'));
            console.log(e);
            spinner.stop();
        });

        */
    });

program
    .command('init')
    .description(chalk.green('Create new project'))
    .action(function (env) {
        init();
        run();
    });


program
    .command('serve')
    .description(chalk.green('Run React/Flutter app on development mode'))
    .action(function (env) {
        init();

        // load project package.json file
        if (fs.existsSync(path.join(androidjs.project.paths.__dirname, 'package.json'))) {
            androidjs.project.pkg = require(path.join(androidjs.project.paths.__dirname, 'package.json'));
        } else {
            console.log(chalk.red("Not a androidjs project"));
            console.log(chalk.blue(`package.json not found in ${androidjs.project.paths.__dirname}`));

        }

        if (androidjs.project.pkg && androidjs.project.pkg['project-type'] === 'react-native') {
            const r = new React(androidjs);
            r.serve();
        }

        if (androidjs.project.pkg && androidjs.project.pkg['project-type'] === 'webview') {
            console.log(chalk.gray('native app do not supports serve command'));
            console.log(chalk.green('live inspect for native app will be available soon'));
        }
        // run();
    });

program
    .command('build')
    .alias('b')
    .description(chalk.green('Build the .akp'))
    .option("-f, --force [mode]", "Force to replace the current dist folder")
    .option("-i, --install [mode]", "install using adb")
    .action(function (cmd, options) {
        androidjs.install = cmd.install;
        buildApp(cmd, options);
    }).on('--help', function () {

    // console.log('');
    // console.log('Examples:');
    // console.log('');
    // console.log(`  $ ${androidjs.name} b`);
    // console.log(`  $ ${androidjs.name} b -f`);
    // console.log(`  $ ${androidjs.name} build`);
});


if (process.argv.length < 3) {
    init();
    console.log(chalk.green(`$ ${androidjs.name}`), chalk.gray('--help'));
}
program.parse(process.argv);


function buildApp(cmd, options) {
    if (fs.existsSync(path.join(androidjs.project.paths.__dirname, 'package.json'))) {
        androidjs.project.pkg = require(path.join(androidjs.project.paths.__dirname, 'package.json'));

        if (androidjs.project.pkg['project-type'] === 'react-native') {
            const r = new React(androidjs);
            console.log('react-app');

        } else if (androidjs.project.pkg['project-type'] === 'webview') {
            const n = new Native(androidjs);
            console.log('webview:', androidjs.project.pkg.name);
            n.build();
        }

    } else {
        console.log(chalk.red("Not a androidjs project"));
        console.log(chalk.blue(`package.json not found in ${androidjs.project.paths.__dirname}`));
    }
}

function install_using_adb() {
    const {spawn} = require('child_process');
    let install = spawn('adb', ['install', '-r', path.join(androidjs.project.paths.__dirname, 'app.apk')]);
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


function loadConfig(androidjs) {
    let config = jsonfile.readFileSync(path.join(androidjs.builder.paths.config, 'config.json'));
    androidjs.builder.config = {...androidjs.builder.config, ...config};
}