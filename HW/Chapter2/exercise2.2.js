const fs = require('fs');
const path = require('path');
const util = require('util');

const readDir= util.promisfy(fs.readdir); // directory 내용 읽어오기
const readStat = util.promisfy(fs.stat); // file or directory 정보 조회

const PATH = './test'

const directorySearch = async dirctory => {
    const files = await readDir(directory);
    files.forEach(async file => {
        const filePath = path.join(directory, file);
        const stat = await readStat(filePath);
        if(stat.isDirectory()) await directorySearch(filePath);
        else if (path.extname(filePath) === '.js') console.log(filePath);
    });
};

(async () => {
    try {
        await directorySearch(PATH);
    } catch(err) {
        console.error(err);
    }
})();

