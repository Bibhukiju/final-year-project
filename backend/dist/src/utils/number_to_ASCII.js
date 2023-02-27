"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.decoder = void 0;
const app_1 = require("../app");
function decoder(encoded) {
    let s = "";
    let encodedStringArray = encoded.split("-");
    for (let key of encodedStringArray) {
        // console.log("decrypt key is: ", decrypt(parseInt(key)));
        if (decrypt(parseInt(key)) < 65) {
            s += decrypt(parseInt(key));
        }
        else {
            s += String.fromCharCode((decrypt(parseInt(key))));
        }
    }
    return s;
}
exports.decoder = decoder;
// to decrypt the given number
function decrypt(message) {
    let d = app_1.rsa.d;
    const n = app_1.rsa.n;
    console.log(d, n, 'e and n');
    let decrypted_text = 1;
    while (d--) {
        decrypted_text = decrypted_text * message;
        decrypted_text = decrypted_text % n;
        console.log(decrypted_text);
    }
    let a = (Math.pow(message, d)) % n;
    console.log(a, 'This is a');
    return decrypted_text;
}
