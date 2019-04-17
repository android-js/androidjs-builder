#!/usr/bin/env node


const os = require('os');
const program = require('commander');
const path = require('path');
const pkg = require('../package.json');

const {copyExample} = require('../lib/copyExample');
const {buildApk} = require('../lib/buildApk');


const DEBUG = false;


const version = pkg.version;
const module_name = "androidjs";

const BUILDER__cwd = path.join(__dirname, '..');
const PROJECT__cwd = process.cwd();
let PROJECT__dist = pkg["dist-path"] || path.join(PROJECT__cwd, 'dist');

if (PROJECT__dist[0] === '.') {
    PROJECT__dist = path.join(PROJECT__cwd, PROJECT__dist);
}


let config = {
    DEBUG,
    BUILDER__cwd,
    PROJECT__cwd,
    PROJECT__dist,
    platform: os.platform()
};


if(process.argv.length < 3) {
    console.log(`androidjs-builder version: ${version}`);
    console.log(`Use: ${module_name} --help`);
}


// function checkUpdate() {
// }

function generateApp(args = {}) {
    copyExample(args);
}

function buildApp(args = {}) {
    buildApk(args)
}


program
    .version(version)
    .description('androidjs requires JRE version  > 1.8.0 \nwhich can be found here https://filehippo.com/download_jre_64/')
// .option('-u, --update ', `update ${module_name}`)

program
    .command('generate [args]')
    .alias('g')
    .description('Generate new project')
    .option("-e, --example [example]", "Example name")
    .action(function (env, options) {

        let app_name = options.example || 'myapp';

        config.app_name = app_name;

        generateApp(config);

    }).on('--help', function () {
    console.log('');
    console.log('Examples:');
    console.log('');
    console.log(`  $ ${module_name} -e myapp`);
    console.log(`  $ ${module_name} --example myapp`);
});

program
    .command('build')
    .alias('b')
    .description('Build the .akp')
    .option("-f, --force_replace [mode]", "Force to replace the current dist folder")
    .action(function (cmd, options) {

        config.force_replace = cmd.force_replace === true;

        buildApp(config);


    }).on('--help', function () {
    console.log('');
    console.log('Examples:');
    console.log('');
    console.log(`  $ ${module_name} b`);
    console.log(`  $ ${module_name} b -f`);
    console.log(`  $ ${module_name} build`);
});

program
    .command('about')
    .action(function (env) {
        console.log(`${module_name} provides easy android application development environment`);
        console.log(`for more information go to https://android-js.github.io/`);
    });

program.parse(process.argv);
