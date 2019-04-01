const Rcopy = require('recursive-copy');
var path = require('path');
var copydir = require('copy-dir');

Array.prototype.contains = function(element){
    return this.indexOf(element) > -1;
};


function copy(__src, __dest, msg, filters) {
    return new Promise((resolve, reject) => {
        copydir.sync(__src, __dest, function (stat, filepath, filename) {
            if (stat === 'directory' && filename === 'dist') {
                if(filters.contains(filepath))return false;
                // console.log('dirname is ', filename, filepath);
                return true;
            }else {
                return true;
            }

        }, function (err) {
            if (err) throw err;
        });

        resolve(0);
    });
}


// function copy(__src, __dest, msg, filters) {
//     let options = {
//         overwrite: true,
//         expand: true,
//         dot: true,
//         junk: true,
//         filter: [
//             '**/*',
//             '!.htpasswd',
//             ...filters
//         ],
//         // rename: function(filePath) {
//         //     return filePath + '.orig';
//         // },
//         // transform: function(src, dest, stats) {
//         //     if (path.extname(src) !== '.txt') { return null; }
//         //     return through(function(chunk, enc, done)  {
//         //         var output = chunk.toString().toUpperCase();
//         //         done(null, output);
//         //     });
//         // }
//     };
//
//     console.log('copying from', __src);
//     console.log('copying to', __dest);
//
//     return new Promise((resolve, reject) => {
//         Rcopy(__src, __dest, options).on(Rcopy.events.COMPLETE, function (copyOperation) {
//             console.info(`${msg} done!`);
//             resolve(0);
//         }).on(copy.events.COPY_FILE_START, function (copyOperation) {
//             console.info('Copying file ' + copyOperation.src + '...');
//         }).then(function (results) {
//             console.info(results.length + ' file(s) copied');
//         }).catch(error => {
//             reject(error);
//         });
//     })
//
//
// }


module.exports = {
    copy
};