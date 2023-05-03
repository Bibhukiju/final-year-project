import { permute, hexToBinary, initial_perm, exp_d, Xor, binaryToDecimal, sbox, decimalToBinary, per, final_perm, binaryToHex } from "../index";

export const encrypt = (plainText: string, rkb: Array<any>, rk: Array<any>) => {
    let pt = hexToBinary(plainText);

    // ? initial permuation
    pt = permute(pt, initial_perm, 64)
    console.log("After Initial Permuation", binaryToHex(pt))

    let left = pt.slice(0, 32)
    // console.log(left);

    let right = pt.slice(32, 64)
    console.log(right, "this is right")
    console.log(left + right)


    for (let i = 0; i < 16; i++) {
        // ? Expansion D-box: Expanding the 32 bits data into 48 bits
        let right_expanded = permute(right, exp_d, 48)
        console.log(right_expanded, "expanded")
        // ?  XOR RoundKey[i] and right_expanded
        let xor_x = Xor(right_expanded, rkb[i])
        console.log(xor_x, 'xor_x')

        // ? S-boxex: substituting the value from s-box table by calculating row and column
        let sbox_str = ""
        for (let j = 0; j < 8; j++) {
            let row = binaryToDecimal(parseInt(xor_x[j * 6] + parseInt(xor_x[j * 6 + 5])).toString())
            // console.log(row)
            let test = xor_x[j * 6 + 1] + xor_x[j * 6 + 2] + xor_x[j * 6 + 3] + xor_x[j * 6 + 4]
            // console.log(test, "from col")
            let col = binaryToDecimal(test)
            // console.log(col, "col")

            let val = sbox[j][row][col]
            sbox_str = sbox_str + decimalToBinary(val)
        }
        sbox_str = permute(sbox_str, per, 32)
        let result = Xor(left, sbox_str)
        left = result
        // console.log(left)
        if (i != 15) {
            [left, right] = [right, left]
        }
        // console.log("Round ", i + 1, " " + binaryToHex(left) + " ", binaryToHex(right), " ", rk[i])


    }
    let combine = left + right
    let cipher_text = binaryToHex(permute(combine, final_perm, 64))
    return cipher_text

}