var path = require('path');
const Rcopy = require('recursive-copy');
var copydir = require('copy-dir');

Array.prototype.contains = function (element) {
    return this.indexOf(element) > -1;
};


function copyDir(__src, __dest, filters) {
    return new Promise((resolve, reject) => {
        copydir.sync(__src, __dest, function (stat, filepath, filename) {
            // if (stat === 'directory') {
            if (filters.contains(filepath)) {
                return false;
            }else {
                return true;
            }

        }, function (err) {
            throw "ERROR: failed to copy\n";
            // if (err) throw err;
        });

        resolve(0);
    });
}

module.exports = {
    copyDir
};