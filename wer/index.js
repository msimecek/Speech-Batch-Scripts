const fs = require("fs");
const cmdArgs = require("command-line-args");
const wer = require("word-error-rate");

const args = cmdArgs([
    { name: "file1", type: String },
    { name: "file2", type: String },
    { name: "help", alias: "h", type: Boolean, defaultValue: false }
  ]);


if (args.file1 === undefined || args.file2 === undefined) {
    console.error("Provide two files to compare them (as -f1 and -f2).");
    args.help = true;
}

const file1 = fs.readFileSync(args.file1, { encoding: "utf-8" });
const file2 = fs.readFileSync(args.file2, { encoding: "utf-8" });

var filename1 = args.file1.replace(/^.*[\\\/]/, '');
var filename2 = args.file2.replace(/^.*[\\\/]/, '');

console.log(`${filename1},${filename2},${wer.wordErrorRate(file1, file2)},${wer.calculateEditDistance(file1, file2)}`)

// console.log(args.file1, " vs. ", args.file2);
// console.log("\tDistance: ", wer.calculateEditDistance(file1, file2));
// console.log("\tWER: ", wer.wordErrorRate(file1, file2));

