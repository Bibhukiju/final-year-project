import { rsa } from '../app'

export function decoder(encoded: string) {
    let s: string = "";
    let encodedStringArray = encoded.split("-");
    for (let key of encodedStringArray) {
        // console.log("decrypt key is: ", decrypt(parseInt(key)));
        if (decrypt(parseInt(key)) < 65) {
            s += decrypt(parseInt(key));
        } else {
            s += String.fromCharCode((decrypt(parseInt(key))));
        }
    }

    return s;
}

// to decrypt the given number
function decrypt(message: number) {
    let d = rsa.d;
    const n = rsa.n;
    console.log(d, n, 'e and n')
    let decrypted_text: number = 1;
    while (d--) {
        decrypted_text = decrypted_text * message;
        decrypted_text = decrypted_text % n;
        console.log(decrypted_text);
    }

    return decrypted_text;
}