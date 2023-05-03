"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encrypt = void 0;
const index_1 = require("../index");
const encrypt = (plainText, rkb, rk) => {
    let pt = (0, index_1.hexToBinary)(plainText);
    // ? initial permuation
    pt = (0, index_1.permute)(pt, index_1.initial_perm, 64);
    console.log("After Initial Permuation", (0, index_1.binaryToHex)(pt));
    let left = pt.slice(0, 32);
    // console.log(left);
    let right = pt.slice(32, 64);
    console.log(right, "this is right");
    console.log(left + right);
    for (let i = 0; i < 16; i++) {
        // ? Expansion D-box: Expanding the 32 bits data into 48 bits
        let right_expanded = (0, index_1.permute)(right, index_1.exp_d, 48);
        console.log(right_expanded, "expanded");
        // ?  XOR RoundKey[i] and right_expanded
        let xor_x = (0, index_1.Xor)(right_expanded, rkb[i]);
        console.log(xor_x, 'xor_x');
        // ? S-boxex: substituting the value from s-box table by calculating row and column
        let sbox_str = "";
        for (let j = 0; j < 8; j++) {
            let row = (0, index_1.binaryToDecimal)(parseInt(xor_x[j * 6] + parseInt(xor_x[j * 6 + 5])).toString());
            // console.log(row)
            let test = xor_x[j * 6 + 1] + xor_x[j * 6 + 2] + xor_x[j * 6 + 3] + xor_x[j * 6 + 4];
            // console.log(test, "from col")
            let col = (0, index_1.binaryToDecimal)(test);
            // console.log(col, "col")
            let val = index_1.sbox[j][row][col];
            sbox_str = sbox_str + (0, index_1.decimalToBinary)(val);
        }
        sbox_str = (0, index_1.permute)(sbox_str, index_1.per, 32);
        let result = (0, index_1.Xor)(left, sbox_str);
        left = result;
        // console.log(left)
        if (i != 15) {
            [left, right] = [right, left];
        }
        // console.log("Round ", i + 1, " " + binaryToHex(left) + " ", binaryToHex(right), " ", rk[i])
    }
    let combine = left + right;
    let cipher_text = (0, index_1.binaryToHex)((0, index_1.permute)(combine, index_1.final_perm, 64));
    return cipher_text;
};
exports.encrypt = encrypt;
