const findJava = require('find-java-home');



export function javaVersion(callback) {
    findJava(callback);
}
