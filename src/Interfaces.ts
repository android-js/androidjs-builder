import {Command} from 'commander';

export namespace Interfaces {
    export interface IProject {
        name: string
        dir: string
        type: string
        package?: IPackage
    }

    export interface IBuilder {
        dir: string
        debug?: boolean
        cache: string
        commander: Command
    }

    export interface IEnv {
        force: boolean
        release: boolean
        project: Interfaces.IProject
        builder: Interfaces.IBuilder
    }

    export interface IContext {
        updateSdk: any;
        commander: Command
    }
    export interface IBuilderModule {
        installModule(env: IEnv, context:IContext): number
        create(): number
        build(): number
        _?: IContext
    }

    export interface GithubFileLink {
        user: string
        repo: string
        file: string
        dir: string
    }

    export interface IPackage {
        version: string
        name: string
        type: string
        'package-name': string
        'app-name': string
        permission: Array<string>
        'deep-link': Array<IDeepLink>
    }
    export interface IDeepLink {
        scheme: string,
        host: string
    }

    export interface IGithubRepoLink {
        user: string
        repo: string
    }

}
