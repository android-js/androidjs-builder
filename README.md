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

## Generate new project
```bash
$ androidjs g
    or
$ androidjs g --dir=/path/to/the/project
```
this command will generate a basic structure for quick start
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


## Build project
```bash
$ androidjs build
    or
$ androidjs b --src=/path/to/the/project
```
it will create apk inside ``./myapp/dist/``
