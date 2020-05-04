import {Interfaces} from "../../Interfaces";
import IEnv = Interfaces.IEnv;
const path = require('path');
const fs = require('fs');
const yaml = require('js-yaml');


var primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199];
let header = '!!brut.androlib.meta.MetaInfo\n';


function expmod( base, exp, mod ){
  if (exp == 0) return 1;
  if (exp % 2 == 0){
    return Math.pow( expmod( base, (exp / 2), mod), 2) % mod;
  }
  else {
    return (base * expmod( base, (exp - 1), mod)) % mod;
  }
}

function gethesh(str: string) {
	var ans = 0;
	for(var index=0; index < str.length; index++) {
		ans = (ans +((str.charCodeAt(index)% 97) * expmod(primes[index], index, 97)) % 97) % 97;
	}
	return ans.toString();
}

function pad(str, len=2) {
	var ans = str;
	for(var i=str.length; i < len; i++) ans = '0' + ans;
	return ans;
}

export function getAppVersion(env: IEnv, args) {
	var versionInfo = {
		versionCode: null, 
		versionName: null
	};

	let pkgVersion = env.project.package.version;
	versionInfo.versionName = pkgVersion;

	var arr = pkgVersion.split('-');
	// @ts-ignore
	arr[0] = arr[0].split('.');
	let versionCode = pad(arr[0][0], 3);
	versionCode += pad(arr[0][1]);
	versionCode += pad(arr[0][2]);
	versionCode += pad(gethesh(arr[1]||' '));
	versionInfo.versionCode = parseInt(versionCode);
	return versionInfo;
}

export function updateApkVersion(env: IEnv, args) {
	console.log("Setting app version ...");
	let ymlFile = path.join(env.builder.cache, args.sdk.repo, 'apktool.yml');

	try {
	    let fileContents = fs.readFileSync(ymlFile, 'utf8');

	    let data = yaml.safeLoadAll(fileContents.substring(header.length-1, fileContents.length));
	    console.log("Version Code:", data[0].versionInfo.versionCode);
	    console.log("Version Name:", data[0].versionInfo.versionName);
	    let version = getAppVersion(env, args);
	    data[0].versionInfo = version;

	    let yamlStr = yaml.safeDump(data[0]);
	    
		fs.writeFileSync(ymlFile, header + yamlStr, 'utf8');
	} catch (e) {
	    console.log(e);
		process.exit();
	}
}

