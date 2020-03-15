const chalk = require('chalk');

export class LoadingBar{
    isRunning: boolean;
    loop: any;
    interval: number;
    currentIndex: number;
    bar_length: number;
    fill: string;
    empty: string;
    flip: number;
    success: string;
    failed: string;
    chunksDownloaded: string;
    message: string;
    constructor() {
        this.interval = 100;
        this.currentIndex = 0;
        this.fill = '█';
        this.empty = '⬜';
        this.bar_length = 50;
        this.loop = null;
        this.flip = 1;
        this.chunksDownloaded="0";
        this.isRunning = false;
        this.success = ' √';
        this.failed = ' X';
        this.message = '';
    }
    reset() {
        this.constructor();
    }
    next() {
        this.clear();
        this.currentIndex += this.flip;
        if(this.currentIndex === this.bar_length || this.currentIndex === 0){
            this.flip *= -1;
        }
        let _left = this.currentIndex - 1;
        _left = _left < 0 ? 0 : _left;
        let _right = this.bar_length - _left - 1;
        process.stdout.write(`${this.message}${this.chunksDownloaded} :` + chalk.green(` ${this.empty.repeat(_left)}${this.fill}${this.empty.repeat(_right)}`));
    }
    clear(){
        //@ts-ignore
        process.stdout.clearLine();
        //@ts-ignore
        process.stdout.cursorTo(0);
    }

    start(speed?:number) {
        this.isRunning = true;
        this.loop = setInterval(()=>{
            this.next();
        }, speed || this.interval);
    }
    stop(error:{[key: string]: string| number}=null) {
        if(this.isRunning){
            this.isRunning = false;
            if(this.loop !==null) {
                clearInterval(this.loop);
                this.clear();
                if(error===null) {
                    console.log(`${this.message}${this.chunksDownloaded} :` + chalk.green(this.fill.repeat(this.bar_length)+this.success));
                } else {
                    this.clear();
                    console.log(chalk.red(error.message));
                }
            }
        }
    }
}



export class ProgressBar {
    total: number;
    current: number;
    bar_length: number;
    bar_fill: string = "⣿";
    bar_current: string = "⣦";
    barr_empty: string = "⣀";
    constructor(total?:number) {
        this.total = total || null;
        this.current = 0;
        this.bar_length = process.stdout.columns - 30;
        // this.bar_length = 50;
    }
    next(progress) {
        let _left:number = parseInt(((progress * this.bar_length) / this.total).toFixed(0));
        let _right = this.bar_length - _left;
        let _p = (progress * 100) / this.total;
        let _in_progress_code = _p === 100 ? this.bar_fill : this.bar_current;

        _left = _left > 1 ? _left : 1;

        this.clearLine();
        const _str = `  ${_p}% : ${chalk.green(this.bar_fill.repeat(_left-1)+_in_progress_code)}${ this.barr_empty.repeat(_right)}`;
        process.stdout.write(_str);
        // console.log(_left, _right)
    }
    clearLine() {
        //@ts-ignore
        process.stdout.clearLine();
        //@ts-ignore
        process.stdout.cursorTo(0);
    }
}
