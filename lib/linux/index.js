const {getArgs} = require('../getArgs');
const {spawn} = require('child_process');
const path = require('path');
const Rcopy = require('recursive-copy');
const fs = require('fs');
const {copy} = require('../copy');
const args = getArgs();

//
const __bin = path.join(__dirname, '..', '..', 'bin');
// const __myapp_path = path.join(process.argv[1], '..', '..', 'myapp');
// const __apk_myapp_path = path.join(__bin, 'app-debug', 'assets', 'myapp');
//
// console.log(__myapp_path);
//
const commands = {
    apktool: path.join(__bin, 'linux', 'apktool'),
    signer: path.join(__bin, 'linux', 'uber-apk-signer-1.0.0.jar')
};


// DECOMPILE the apk
function decompile(__dest) {
    console.log('Decompiling...');

    return new Promise((resolve, reject) => {
        if (fs.existsSync(path.join(__dest, 'app-debug'))) {
            console.log('decompilation skip');
            resolve(0);
        } else {

            console.log('decompilation require', path.join(__dest, 'app-debug'));
            // create 'dist' if dose not exist
            if (!fs.existsSync(__dest)) {
                fs.mkdirSync(__dest, (err) => {
                    if (err) {
                        console.log(err);
                        console.error(`ERROR! Can't make the directory! '${__dest}'\n`);
                    }
                });

                console.log(__dest);
                copy(path.join(__bin, 'dist'), __dest, 'copying', []);

            } else {
                console.log(__dest);
                copy(path.join(__bin, 'dist'), __dest, 'copying', []);
            }

            // no decompilation require
            //////////////////////////////////////////////////////////////////////
            // 	let args_ = ['d', path.join(__bin, './app-debug.apk')];         //
            // 	if(args.f === true) {                                           //
            // 		args_.push('-f');                                           //
            // 	}                                                               //
            //                                                                  //
            //                                                                  //
            // 	const proc = spawn(commands.apktool, args_, {cwd: __bin});      //
            // 	proc.stdout.on('data', data => {                                //
            // 		console.log(`${data}`);                                     //
            // 	});                                                             //
            //                                                                  //
            // 	proc.stderr.on('data', (data) => {                              //
            // 		console.log(`stderr: ${data}`);                             //
            // 	});                                                             //
            //                                                                  //
            // 	proc.on('close', (code) => {                                    //
            // 		console.log(`decompile process exited with code ${code}`);  //
            // 		if(`${code}` == 0){                                         //
            resolve(0);                                                         //
            // 		}else {                                                     //
            // 			reject(1);                                              //
            // 		}                                                           //
            // 	});                                                             //
            //////////////////////////////////////////////////////////////////////
        }
    });
}


function _copy(__src, __dest) {
    return new Promise((resolve, reject) => {
        copy(__src, __dest, 'copying assets', [path.join(__src, 'dist')]).then((i) => {
            resolve(i);
        }).catch((err) => {
            console.log('failed to copy file\n', err);
        });
    });

}

//
// function copy() {
// 	let options = {
// 	    overwrite: true,
// 	    expand: true,
// 	    dot: true,
// 	    junk: true,
// 	    filter: [
// 	        '**/*',
// 	        '!.htpasswd',
// 	    ],
// 	    // rename: function(filePath) {
// 	    //     return filePath + '.orig';
// 	    // },
// 	    // transform: function(src, dest, stats) {
// 	    //     if (path.extname(src) !== '.txt') { return null; }
// 	    //     return through(function(chunk, enc, done)  {
// 	    //         var output = chunk.toString().toUpperCase();
// 	    //         done(null, output);
// 	    //     });
// 	    // }
// 	};
// 	console.log('copy');
// 	return new Promise((resolve, reject) => {
// 		Rcopy(__myapp_path, __apk_myapp_path, options).on(Rcopy.events.COMPLETE, function(copyOperation) {
//         	console.info('Copied!!');
//         	resolve(0);
//     	}).catch(error => {
//     		reject(error);
//     	});
// 	})
//
// }

function sign(__src) {
	console.log('Sign apk');
	let args_ = ['-jar', commands.signer, '--apks', path.join(__src, 'dist', 'app.apk'),'--out', path.join(__src, 'dist', 'APK'), '--debug'];

	const proc = spawn('java', args_, {cwd: __bin});
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

function build(__src, __dest) {
    console.log('Building...');
    console.log(`src ${__src} \ndest ${__dest}`);
    return new Promise((resolve, reject) => {
        let args_ = ['b', __src, '-o', __dest+'.apk'];

        const proc = spawn(commands.apktool, args_, {cwd: __src});
        proc.stdout.on('data', data => {
            console.log(`${data}`);
        });

        proc.stderr.on('data', (data) => {
            console.log(`stderr: ${data}`);
            reject(1);
        });

        proc.on('close', (code) => {
            console.log(`build process exited with code ${code}`);
            resolve(0);
        });
    });
}

//
// if(args.d === true) {
// 	decompile();
// }
//
//
// if(args.c === true) {
// 	copy();
// }
//
//
// if(args.b === true) {
// 	decompile().then(()=>{
// 		copy().then(()=> {
// 			build().then(() => {
// 				sign();
// 			});
// 		});
// 	}).catch(error => {
// 		console.log(`${error}`);
// 	});
// }
//
//
//
// // *****************TESTING..********************************
// if(args.copy) {
// 	console.log('coping...');
// 	const ls = spawn('ls', ['-lh', __myapp_path]);
//
// 	ls.stdout.on('data', (data) => {
// 		console.log(`stdout: ${data}`);
// 	});
//
// 	ls.stderr.on('data', (data) => {
// 		console.log(`stderr: ${data}`);
// 	});
//
// 	ls.on('close', (code) => {
// 		console.log(`child process exited with code ${code}`);
// 	});
// }
// //************************************************************


module.exports = {
    decompile,
    copy: _copy,
    build,
    sign,
};
