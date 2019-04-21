# Addroidjs
### Platform to build fully featured android app in node js.

- Quick start
    - install android js from 'npm' ``$ sudo npm i -g androidjs-builder ``
    - create new folder/dir & cd into it ``$ mkdir myapp && cd myapp``
    - generate project structure ``$ androidjs g``
    - build apk ``$ androidjs b``

## install from npm
```bash
$ sudo npm install -g androidjs-builder 
```
Since we have installed 'androidjs-builder' globally , it will provide all necessary commands build our app

## Generate new project
```bash
$ mkdir myapp
$ cd myapp
$ androidjs g
$ androidjs generate
```
This command will generate a basic structure for quick start

```text
 myapp
    |__ assets
    |       |__ ipc, css, js
    |
    |__ views
    |       |__ index.html
    |
    |__ main.js
    |__ package.json

```

- main.js is the main file or we can say it is back process of your app which execute all the code written in node, so you can write your node js code inside main.js
- index.html is the first view which is render by app initially
- package.json to keep track of all your node packages
- assets to store all assets of your app



## Build project
```bash
$ cd myfirstapp
$ androidjs build
```
it will create apk inside ``./myapp/dist/``


## Other examples
```commandline
$ androidjs g --example helloworld
$ androidjs g --example myapp
$ androidjs g --example camera
$ androidjs g --example story
```