const chalk = require("chalk");
const figlet = require("figlet");
const {Copy} = require('./copy');
const {spawn} = require('child_process');


// const ls = spawn('ls', ['-lh', './']);

// ls.stdout.on('data', (data) => {
//   console.log(`stdout: ${data}`);
// });

// ls.stderr.on('data', (data) => {
//   console.log(`stderr: ${data}`);
// });

// ls.on('close', (code) => {
//   console.log(`child process exited with code ${code}`);
// });


// moved to androidjs.builder.config.github
// const config = {
//     username: 'DeveshPankaj',
//     repo: 'sample-app',
//     branch: 'master'
// };

let React = class {

    constructor(androidjs) {
        this.androidjs = androidjs;
    }

    init() {
        console.log(chalk.yellow(`Init React project at: ${this.androidjs.project.paths.__dirname}`));

        let copy = new Copy(this.androidjs.debug);
        let config = {
            github: {
                repo: this.androidjs.builder.config.github.repo.react_app,
                username: this.androidjs.builder.config.github.username,
                branch: this.androidjs.builder.config.github.branch
            }
        };
        let filepath = '';
        copy.fromGithub(config, filepath)
            .to(this.androidjs.project.paths.__dirname);

        // let cp = spawn('cp', ['-r', this.androidjs.builder.paths.react_app, this.androidjs.project.paths.__dirname]);

        // cp.stdout.on('data', data => {
        //     console.log(data);
        // });

        // cp.stderr.on('data', data => {
        //     console.log(data);
        // });

        // cp.on('close', code => {
        //     console.log('Exit:', code);
        // });
    }

    build() {
        console.log(chalk.green(`using ${this.androidjs.name}: ${this.androidjs.version}`));
        console.log(chalk.gray(`Building React project`));

    }

    serve() {
        console.log(chalk.green("Android JS Starting Development Server For React-Native, using..."));
        console.log(chalk.blue(`cd ${this.androidjs.project.paths.__dirname} && react-native run-android`));

        console.log('if failed run\nchmod 755 android/gradlew\nand set sdk.dir path in your project\'s android/local.properties file');


        let run = spawn('react-native', ['run-android'], {
            stdio: 'inherit',
            shell: true,
            detached: true,
            cwd: this.androidjs.project.paths.__dirname
        });

        // run.stdout.on('data', data => {
        //     console.log(data);
        // });
        //
        // run.stderr.on('data', data => {
        //     console.log(data);
        // });
        //
        // run.on('close', code => {
        //     console.log('Exit:', code);
        // });
    }
};


module.exports = {
    React
};
