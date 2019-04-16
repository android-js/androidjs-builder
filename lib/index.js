const {getArgs} = require('./getArgs');
const {spawn} = require('child_process');
const path = require('path');
const Rcopy = require('recursive-copy');
const fs = require('fs');
const {copy} = require('./copy');
const xml2js = require('xml2js');

const args = getArgs();

//
const __bin = path.join(__dirname, '..', 'bin');
// const __myapp_path = path.join(process.argv[1], '..', '..', 'myapp');
// const __apk_myapp_path = path.join(__bin, 'app-debug', 'assets', 'myapp');
//
// console.log(__myapp_path);
//
const commands = {
    apktool: path.join(__bin, 'build_tools', 'apktool.jar'),
    signer: path.join(__bin, 'build_tools', 'uber-apk-signer-1.0.0.jar')
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
	let args_ = ['-jar', commands.signer, '--apks', path.join(__src, 'dist', 'app.apk'), '--debug'];

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


function updateAndroidManifest(__src) {
    console.log('Updating AndroidManifest.');

    return new Promise((resolve, reject)=> {
            // get user package.json file and get the app-name
        let pkg = require(path.join(__src, '..', '..', 'package.json'));
        let pkg_name = pkg['package-name'];

        if(pkg_name === undefined) {
            throw "'app-name' is not defined in package.json";
        }

        // get user AndroidManifest file
        const AndroidManifest = path.join(__src, 'AndroidManifest.xml');

        console.log('reading', AndroidManifest);

        let parser = new xml2js.Parser();
        let builder = new xml2js.Builder();

        fs.readFile(AndroidManifest, function(err, data) {
                parser.parseString(data, function (err, result) {
                    // console.dir(result);
                    result.manifest['$'].package = 'com.androidjs.' + pkg_name;

                    console.log('package name', result.manifest['$'].package);

                    // if(result.manifest['uses-permission'] === undefined) {
                        result.manifest['uses-permission'] = [];
                    // }

                    for (var i = pkg.permission.length - 1; i >= 0; i--) {
                        let permission = { '$': { 'android:name': pkg.permission[i] } };
                        result.manifest['uses-permission'].push(permission);
                    }

                    for (var i = result.manifest['uses-permission'].length - 1; i >= 0; i--) {
                        console.log(result.manifest['uses-permission'][i]);
                    }

                    var xml = builder.buildObject(result);

                    // console.log(xml);

                    fs.writeFile(AndroidManifest, xml, function(err, data) {
                        if(err) throw err;
                        console.log('Done!');

                        resolve(0);
                    });

                });
            });
        });
}


function updateAppName(__src) {
    return new Promise((resolve, reject) => {
        let ValuesFile = path.join(__src, 'res', 'values', 'strings.xml');
        console.log('changing app name', ValuesFile);

        let pkg = require(path.join(__src, '..', '..', 'package.json'));
        let app_name = pkg['app-name'];

        let parser = new xml2js.Parser();
        let builder = new xml2js.Builder();


        fs.readFile(ValuesFile, function(err, data) {
                parser.parseString(data, function (err, result) {

                    // find and replace app name
                    for (var i = result.resources.string.length - 1; i >= 0; i--) {
                        if(result.resources.string[i]['$'].name === 'app_name') {
                            result.resources.string[i]._ = app_name;
                            console.log(result.resources.string[i]);
                        }
                    }

                    var xml = builder.buildObject(result);

                    fs.writeFile(ValuesFile, xml, function(err, data) {
                        if(err) throw err;
                        console.log('App name Changed !');

                        resolve(0);
                    });

                });
            });

    });
    
}


function updateIcon(__src) {
    return new Promise((resolve, reject)=> {

        let pkg = require(path.join(__src, '..', '..', 'package.json'));

        let icon0 = path.join(__src, 'res', 'mipmap-hdpi-v4', 'ic_launcher.png');
        let icon1 = path.join(__src, 'res', 'mipmap-hdpi-v4', 'ic_launcher_round.png');

        let icon2 = path.join(__src, 'res', 'mipmap-mdpi-v4', 'ic_launcher.png');
        let icon3 = path.join(__src, 'res', 'mipmap-mdpi-v4', 'ic_launcher_round.png');

        let icon4 = path.join(__src, 'res', 'mipmap-xhdpi-v4', 'ic_launcher.png');
        let icon5 = path.join(__src, 'res', 'mipmap-xhdpi-v4', 'ic_launcher_round.png');

        let icon6 = path.join(__src, 'res', 'mipmap-xxhdpi-v4', 'ic_launcher.png');
        let icon7 = path.join(__src, 'res', 'mipmap-xxhdpi-v4', 'ic_launcher_round.png');

        let icon8 = path.join(__src, 'res', 'mipmap-xxxhdpi-v4', 'ic_launcher.png');
        let icon9 = path.join(__src, 'res', 'mipmap-xxxhdpi-v4', 'ic_launcher_round.png');


        if(pkg.icon !== undefined) {
                let userIconPath = path.join(__src, '..', '..', pkg.icon);

                let userIconStream = fs.createReadStream(userIconPath, { flags: 'r',  encoding: "binary",});

                let ic0 = fs.createWriteStream(icon0, { flags: 'w',  encoding: "binary",});
                let ic1 = fs.createWriteStream(icon1, { flags: 'w',  encoding: "binary",});

                let ic2 = fs.createWriteStream(icon2, { flags: 'w',  encoding: "binary",});
                let ic3 = fs.createWriteStream(icon3, { flags: 'w',  encoding: "binary",});

                let ic4 = fs.createWriteStream(icon4, { flags: 'w',  encoding: "binary",});
                let ic5 = fs.createWriteStream(icon5, { flags: 'w',  encoding: "binary",});

                let ic6 = fs.createWriteStream(icon6, { flags: 'w',  encoding: "binary",});
                let ic7 = fs.createWriteStream(icon7, { flags: 'w',  encoding: "binary",});

                let ic8 = fs.createWriteStream(icon8, { flags: 'w',  encoding: "binary",});
                let ic9 = fs.createWriteStream(icon9, { flags: 'w',  encoding: "binary",});


                userIconStream.pipe(ic0)
                userIconStream.pipe(ic1);
                userIconStream.pipe(ic2)
                userIconStream.pipe(ic3);
                userIconStream.pipe(ic4)
                userIconStream.pipe(ic5);
                userIconStream.pipe(ic6)
                userIconStream.pipe(ic7);
                userIconStream.pipe(ic8)
                userIconStream.pipe(ic9);


                resolve(0);
            
        }else {
            console.log('Icon is not define in package.json');
            reject(1);
        }
        
    });
}


function  build(__src, __dest) {
    
    return new Promise((resolve, reject) => {

        // Update AndroidManifest file
        updateAndroidManifest(__src).then(()=>{

            updateAppName(__src).then(()=>{

                updateIcon(__src).then(()=> {

                    console.log('Building...');
                    console.log(`src ${__src} \ndest ${__dest}`);

                    let args_ = ['-jar', commands.apktool, 'b', __src, '-o', __dest+'.apk'];
                    const proc = spawn('java', args_, {cwd: __src});
                    proc.stdout.on('data', data => {
                        console.log(`${data}`);
                    });

                    proc.stderr.on('data', (data) => {
                        console.log(`stderr: ${data}`);
                        // reject(1);
                    });

                    proc.on('close', (code) => {
                        console.log(`build process exited with code ${code}`);
                        resolve(0);
                    });
                });

            });

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
