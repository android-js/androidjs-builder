#!/usr/bin/env node

import {Command} from 'commander';
import {Interfaces} from './Interfaces';
import * as path from 'path';
// import {IContext, loadModules, getClassName} from './loadModules';
import * as fs from 'fs';
import * as inquirer from "inquirer";
import {Webview} from './modules/webview';
import {StaticApp} from './modules/static_app';

import {ReactApp} from "./modules/react";

import {symlink} from "fs";

const pkg = require('./package.json');

const project: Interfaces.IProject = {
    dir: process.cwd(),
    name: 'myapp',
    type: 'webview'
};

const builder: Interfaces.IBuilder = {
    dir: __dirname,
    commander: new Command(),
    cache: path.join(process.env.HOME || process.env.USERPROFILE || process.env.HOMEPATH, '.androidjs', 'cache'),
    debug: false
};

const env: Interfaces.IEnv = {
    force: false,
    release: false,
    project,
    builder
};

// create cache folder
if (!fs.existsSync(path.join(env.builder.cache, '..'))) {
    try {
        fs.mkdirSync(path.join(env.builder.cache, '..'));
        fs.mkdirSync(env.builder.cache);
    } catch (e) {
        if (env.builder.debug) {
            console.warn(e.message);
        }
    }
}

export interface IContext {
    [key: string]: typeof Webview | typeof ReactApp
}

const context: IContext = {
    webview: Webview,
    static: StaticApp,
    'react-native': ReactApp
};

let commander = new Command();
commander.version(pkg.version, '-v, --version')
    .description(`Android-Js Builder: ${pkg.version}`, {});


commander
    .command('init')
    .description('Create new project')
    .option('-f, --force', 'Force to download the required modules and examples')
    .option('-d, --debug', 'Enable debug')
    .action((args) => {
        let ans = inquirer.prompt(questions);
        ans.then(data=> {
            //@ts-ignore
            const {APPNAME, APPTYPE} = data;
            env.project.name = APPNAME;
            env.project.type = APPTYPE;
            env.force = args.forceBuild ? true : false;
            env.builder.debug = args.debug ? true : false;


           

            // load module
            if(context.hasOwnProperty(APPTYPE)){
                let mod = new context[APPTYPE]();
                mod.installModule(env, {});
                mod.create();
            }
        });
    });

commander
    .command('build')
    .alias('b')
    .option('-f, --force', 'Force to download sdk and build tools')
    .option('-d, --debug', 'Enable debug')
    .option('--release', 'Generate apk in release mode')
    .description('Build project')
    .action((args) => {
        if(fs.existsSync(path.join(env.project.dir, 'package.json'))){
            let _package = require(path.join(env.project.dir, 'package.json'));
            env.force = args.force ? true : false;
            env.release = args.release ? true : false;
            env.builder.debug = args.debug ? true : false;
            // check for the project type
            if(context.hasOwnProperty(_package['project-type'])){
                let mod = new context[_package['project-type']]();
                mod.installModule(env, {});
                mod.build();
            }else {
                console.log("Invalid project type:", _package['project-type']);
            }
        }
        else {
            console.log('can not find package.json');
            process.exit();
        }
    });

commander
    .command('update')
    .alias('u')
    .description('Update module')
    .action((args) => {
        let mod = new context['webview']();
        mod.installModule(env, {});
        // @ts-ignore
        mod.downloadSDK((error)=>{
            if(error){
                console.log("error:", error)
            }else {
                console.log("Update complete");
            }
        }, true);
    });


commander.on('command:*', function () {
    commander.help();
});

if(process.argv.length == 2){
    commander.help();
}

// commander.on('--help', function () {
    // for (const key in context) {
    //     loadModules(env, context);
        // context[key]._.commander.help();
    // }
// });

const questions = [
    {
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
            "webview",
            "static",
            // "react-native"
        ],
        // filter: function (val) {
        //     return val.split(".")[1];
        // }
    }
];


commander.parse(process.argv);
// env.builder.commander.parse(process.argv);
// context.Webview.create();
// context.Webview.build();
