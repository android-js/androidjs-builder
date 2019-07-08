const fs = require('fs-extra');
const chalk = require("chalk");
const path = require('path');
const jsonfile = require('jsonfile');

function init_builder(androidjs) {


    if(fs.existsSync(androidjs.builder.paths.dist)) {
        // if cache dose not exist
        if(! fs.existsSync(path.join(androidjs.builder.paths.cache))){
            fs.mkdirSync(path.join(androidjs.builder.paths.cache));
        }

        // if config dose not exist
        if(! fs.existsSync(androidjs.builder.paths.config)){

            fs.mkdirSync(androidjs.builder.paths.config);
            if(androidjs.debug) console.info(chalk.yellow(`creating: ${path.join(androidjs.builder.paths.config, 'config.json')}`));
            let config = {
                androidjs_sdk: '',
                androidjs_react: '',
                androidjs_flutter: ''
            };
            androidjs.builder.config = {...androidjs.builder.config, ...config};
            jsonfile.writeFileSync(path.join(androidjs.builder.paths.config, 'config.json'), config,  {spaces:4});
        }

    } else {

        if(androidjs.debug)console.info(chalk.yellow('initialising builder ....'));

        fs.mkdirSync(androidjs.builder.paths.dist);
        fs.mkdirSync(path.join(androidjs.builder.paths.cache));
        fs.mkdirSync(path.join(androidjs.builder.paths.config));
        let config = {
            androidjs_sdk: '',
            androidjs_react: '',
            androidjs_flutter: ''
        };
        androidjs.builder.config = {...androidjs.builder.config, ...config};
        jsonfile.writeFileSync(path.join(androidjs.builder.paths.config, 'config.json'), config,  {spaces:4});
    }
}


module.exports = {init_builder};