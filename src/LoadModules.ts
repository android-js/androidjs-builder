import { Interfaces } from './Interfaces';
import {Command} from 'commander';
import { readdirSync } from 'fs';
import * as path from 'path';

export interface IContext {[key: string]: Interfaces.IBuilderModule}

export function loadModules(env: Interfaces.IEnv, context:IContext): IContext {
    let ls = readdirSync(path.join(__dirname, 'modules'));

    for(const i in ls) {

        try {
            let mod = require(path.join(__dirname, 'modules', ls[i]));
            if(ls[i].slice(ls[i].length-3) !== '.js' && ls[i].slice(ls[i].length-3) !== '.ts') {
                continue;
            }
            let mod_instance: Interfaces.IBuilderModule = new mod[ls[i].slice(0, ls[i].length - 3)]();

            if(env.builder.debug) {
                console.log(`loading '${mod_instance.constructor.name}' module ...`);
            }

            //@ts-ignore
            let newContext:Interfaces.IContext = {commander: new Command()};
            let returnCode = mod_instance.installModule(env, newContext);

            if(returnCode !== 0) {
                console.warn(`'${mod_instance.constructor.name}' module exit with code: ${returnCode}`);
            }else {
                context[mod_instance.constructor.name] = mod_instance;
                //@ts-ignore
                context[mod_instance.constructor.name]._ = newContext;
            }

        } catch (error) {
            console.log('failed to load modules', error.message);
            process.exit();
        }
    }
    return context;
}



