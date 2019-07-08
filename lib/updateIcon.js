const path = require('path');
const fs = require('fs');


function updateIcon(androidjs) {
    return new Promise((resolve, reject) => {

        let pkg = require(path.join(androidjs.project.paths.__dirname, 'package.json'));
        let p = path.join(androidjs.builder.paths.dist, androidjs.builder.config.github.repo, 'res');

        let icon0 = path.join(p, 'mipmap-hdpi', 'ic_launcher.png');
        let icon1 = path.join(p, 'mipmap-hdpi', 'ic_launcher_round.png');

        let icon2 = path.join(p, 'mipmap-mdpi', 'ic_launcher.png');
        let icon3 = path.join(p, 'mipmap-mdpi', 'ic_launcher_round.png');

        let icon4 = path.join(p, 'mipmap-xhdpi', 'ic_launcher.png');
        let icon5 = path.join(p, 'mipmap-xhdpi', 'ic_launcher_round.png');

        let icon6 = path.join(p, 'mipmap-xxhdpi', 'ic_launcher.png');
        let icon7 = path.join(p, 'mipmap-xxhdpi', 'ic_launcher_round.png');

        let icon8 = path.join(p, 'mipmap-xxxhdpi', 'ic_launcher.png');
        let icon9 = path.join(p, 'mipmap-xxxhdpi', 'ic_launcher_round.png');


        if (pkg.icon !== undefined) {
            let userIconPath = path.join(androidjs.project.paths.__dirname, pkg.icon);

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
            userIconStream.setMaxListeners(userIconStream.getMaxListeners() + 1);

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

