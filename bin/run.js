#!/usr/bin/env node

const {getArgs} = require('../lib/getArgs');
const fs = require('fs');
const path = require('path');
const myglobalmodule = 'androidjs';
var copydir = require('copy-dir');

const os = require('os');
const platform = os.platform();

const args = getArgs();
let pwd = (process.env.PWD === undefined) ? '.' : process.env.PWD;

// if no argument is passed !
if (Object.keys(args).length === 0 && process.argv.length === 2) {
    console.log('try \'--help=generate\'');
    console.log('try \'--help=build\'');
} else {

    // ***************** HELP ***************************
    if (args.help) {
        switch (args.help) {
            case 'build':
                console.log('Build Help .');
                console.log(`$ ${myglobalmodule} -bf\n  or`);
                console.log(`$ ${myglobalmodule} build`);
                console.log(`   To build apk .`);
                console.log(`   -b: build`);
                console.log(`   -f: force build by replacing the existing apk`);
                break;

            case 'generate':
                console.log('Generate Help .');
                console.log(`$ ${myglobalmodule} g`);
                console.log(`$ ${myglobalmodule} g i`);
                console.log(`$ ${myglobalmodule} g --dir=/home`);
                console.log(`$ ${myglobalmodule} g i --dir=/home`);
                break;

            default:
                if (args.help === true) {
                    console.log('try \'--help=generate\'');
                    console.log('try \'--help=build\'');
                } else {
                    console.log(`No help found for '${args.help}'`);
                }

        }
    }
    // ********************** end HELP **************************

    // ********************** GENERATOR *************************
    else if (args.g) {
        if (args.dir) {
            generate(args.dir);
        } else {
            generate(pwd);
        }

    }

    // ********************end Generator ************************

    else if (args.b || args.build) {
        build();
    }

}


// GENERATOR
function generate(__dir) {
    let __generate_dir = __dir;

    // check if given path is relative path
    if (__generate_dir[0] === '.') {
        __generate_dir = path.join(pwd, __generate_dir);
        if (fs.existsSync(__generate_dir)) {
            _generate(__generate_dir);
        } else {
            console.log(`Path not found '${__generate_dir}' at --dir=${__dir}`);
        }
    }

    // for absolute path
    else {
        if (fs.existsSync(__generate_dir)) {
            _generate(__generate_dir);
        } else {
            console.log(`Path not found '${__generate_dir} at --dir=${__dir}'`);
        }
    }
}


function _generate(__dir) {
    const __example_dir = __dirname;
    const __example_name = 'myapp';
    const __example = path.join(__example_dir, '..', 'example', __example_name);


    console.log('generating project at', __dir);
    console.log('coping from ', __example);

    copydir(__example, __dir, (stat, filepath, filename) => {
        // if (stat === 'file' && path.extname(filepath) === '.html') {
        //     return false;
        // }
        // if (stat === 'directory' && filename === '.svn') {
        //     return false;
        // }

        console.log(`Generating: ${filename}`);

        return true;
    }, (err) => {
        if (err) {
            console.log(err);
        } else {
            console.log('copying done!');
            if (args.i) {
                console.log('installing ...');
            }
        }
    });
}


// Builder
function build() {
    let src = args.src;
    let dist = args.dist;

    if (src) {
        if (src[0] === '.') {
            src = path.join(pwd, src);
            if (!fs.existsSync(src)) {
                console.error(`Path not found '${src}' at --src=${args.src}`);
            }
        }
    } else {
        src = pwd;
    }

    if (dist) {
        if (dist[0] === '.') {
            dist = path.join(pwd, dist);
            if (!fs.existsSync(dist)) {
                console.error(`Path not found '${dist}' at --src=${args.dist}`);
            }
        }
    } else {
        const pkg = require(path.join(src, 'package.json'));
        dist = path.join(pwd, pkg['dist-path']);
    }

    __build(src, dist);
}

function __build(__src, __dest) {
    console.log(__src, __dest);
    const mapping = {
        linux: path.join(__dirname, '..', 'lib', 'linux'),
        mac: path.join(__dirname, '..', 'lib', 'mac'),
        win: path.join(__dirname, '..', 'lib', 'win'),
    };

    if (platform !== undefined && mapping[platform] !== undefined) {
        const compile_tools = require(path.join(mapping[platform] , 'index'));

        // copy the pre-decompiled source to the user side
        // copy only if require
        compile_tools.decompile(__dest).then(()=>{
            console.log('Copied the pre-decompiled source to the user side');

            // copy the user's data to the assets folder
            compile_tools.copy(__src, path.join(__dest, 'app-debug', 'assets', 'myapp'), 'copying user files').then(()=>{
                console.log('Copied the user data to the assets folder');

                compile_tools.build(path.join(__src, 'dist', 'app-debug'), path.join(__src, 'dist', 'app')).then(()=>{
                    console.log('Build finished');
                }).then(()=>{

                    compile_tools.sign(__src);
                });
            });
        });

    } else {
        console.log('invalid platform', platform);
    }
}
