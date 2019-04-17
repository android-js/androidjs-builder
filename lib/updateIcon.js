const path = require('path');
const fs = require('fs');


function updateIcon(args) {
    return new Promise((resolve, reject) => {

        let pkg = require(path.join(args.PROJECT__cwd, 'package.json'));

        let icon0 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-hdpi-v4', 'ic_launcher.png');
        let icon1 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-hdpi-v4', 'ic_launcher_round.png');

        let icon2 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-mdpi-v4', 'ic_launcher.png');
        let icon3 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-mdpi-v4', 'ic_launcher_round.png');

        let icon4 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-xhdpi-v4', 'ic_launcher.png');
        let icon5 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-xhdpi-v4', 'ic_launcher_round.png');

        let icon6 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-xxhdpi-v4', 'ic_launcher.png');
        let icon7 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-xxhdpi-v4', 'ic_launcher_round.png');

        let icon8 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-xxxhdpi-v4', 'ic_launcher.png');
        let icon9 = path.join(args.PROJECT__dist, 'app-debug', 'res', 'mipmap-xxxhdpi-v4', 'ic_launcher_round.png');


        if (pkg.icon !== undefined) {
            let userIconPath = path.join(args.PROJECT__cwd, pkg.icon);

            let userIconStream = fs.createReadStream(userIconPath, {flags: 'r', encoding: "binary",});

            let ic0 = fs.createWriteStream(icon0, {flags: 'w', encoding: "binary",});
            let ic1 = fs.createWriteStream(icon1, {flags: 'w', encoding: "binary",});

            let ic2 = fs.createWriteStream(icon2, {flags: 'w', encoding: "binary",});
            let ic3 = fs.createWriteStream(icon3, {flags: 'w', encoding: "binary",});

            let ic4 = fs.createWriteStream(icon4, {flags: 'w', encoding: "binary",});
            let ic5 = fs.createWriteStream(icon5, {flags: 'w', encoding: "binary",});

            let ic6 = fs.createWriteStream(icon6, {flags: 'w', encoding: "binary",});
            let ic7 = fs.createWriteStream(icon7, {flags: 'w', encoding: "binary",});

            let ic8 = fs.createWriteStream(icon8, {flags: 'w', encoding: "binary",});
            let ic9 = fs.createWriteStream(icon9, {flags: 'w', encoding: "binary",});


            userIconStream.pipe(ic0);
            userIconStream.pipe(ic1);
            userIconStream.pipe(ic2);
            userIconStream.pipe(ic3);
            userIconStream.pipe(ic4);
            userIconStream.pipe(ic5);
            userIconStream.pipe(ic6);
            userIconStream.pipe(ic7);
            userIconStream.pipe(ic8);
            userIconStream.pipe(ic9);


            resolve(0);

        } else {
            console.log('Icon is not define in package.json');
            reject(-1);
        }

    });
}


module.exports = {
    updateIcon
};

