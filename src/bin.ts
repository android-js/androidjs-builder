#!/usr/bin/env node

import {Command} from 'commander';
import {Interfaces} from './Interfaces';
import * as path from 'path';
import {IContext, loadModules} from './loadModules';
import * as fs from 'fs';
import * as inquirer from "inquirer";

const pkg = require('../../package.json');

const project: Interfaces.IProject = {
    dir: process.cwd(),
    name: 'myapp',
    type: 'Html'
};

const builder: Interfaces.IBuilder = {
    dir: __dirname,
    commander: new Command(),
    cache: path.join(process.env.HOME || process.env.USERPROFILE || process.env.HOMEPATH, '.android-js', 'cache'),
    debug: false
};

const env: Interfaces.IEnv = {
    force: false,
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
    [key: string]: Interfaces.IBuilderModule
}
const context: IContext = {};

let commander = new Command();
commander.version(pkg.version, '-v, --version')
    .description(`Android-Js Builder: ${pkg.version}`, {});


commander
    .command('create')
    .alias('c')
    .description('Create new project')
    .option('-f, --force-build', 'Build force')
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

            // load modules
            loadModules(env, context);

            // exec creat command
            context[APPTYPE].create();
        });
    });

commander
    .command('build')
    .alias('b')
    .option('-f, --force-build', 'Build force')
    .option('-d, --debug', 'Enable debug')
    .description('Build project')
    .action((args) => {
        if(fs.existsSync(path.join(env.project.dir, 'package.json'))){
            let _package = require(path.join(env.project.dir, 'package.json'));
            env.force = args.forceBuild ? true : false;
            env.builder.debug = args.debug ? true : false;
            loadModules(env, context);
            context[_package['project-type']].build();
        }
        else {
            console.log('can not find package.json');
            process.exit();
        }
    });





commander
    .command('update')
    .alias('u')
    .option('-t, --type <sdk-type>', 'SDK type (Example: Html)')
    .description('Update module')
    .action((args) => {
        let sdkType = args.type;
        if(sdkType){
            loadModules(env, context);
            if(context.hasOwnProperty(sdkType) && context[sdkType]._.hasOwnProperty('updateSdk')){
                let updateSdk = context[sdkType]._.updateSdk;
                updateSdk();
            }else {
                console.log(`invalid module name ${sdkType}`);
                let modules = '';
                for(const moduleName in context) {
                    modules += moduleName + '/';
                }
                console.log(`Use: ${modules.slice(0, modules.length-1)}`);
            }
        }else {
            console.log(`invalid module name ${sdkType}`);
            let modules = '';
            for(const moduleName in context) {
                modules += moduleName + '/';
            }
            console.log(`Use: ${modules.slice(0, modules.length-1)}`);
        }

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
            "Html"
        ],
        // filter: function (val) {
        //     return val.split(".")[1];
        // }
    }
];


commander.parse(process.argv);
// env.builder.commander.parse(process.argv);
// context.Html.create();
// context.Html.build();
