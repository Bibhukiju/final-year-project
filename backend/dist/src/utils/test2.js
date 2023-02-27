let prime = new Set();
let public_key;
let private_key;
let n;
// function primefiler() {
//     // initalizing a seive array of length 250 with true
//     const seive = new Array(250);
//     seive.fill(true);
//     seive[0] = false;
//     seive[1] = false;
//     for (let i = 2; i < 250; i++) {
//         for (let j = i * 2; j < 250; j += i) {
//             console.log(j)
//             seive[j] = false;
//         }
//     }
//     // filling in the prime numbers
//     for (let i = 0; i < seive.length; i++) {
//         if (seive[i]) {
//             prime.add(i);
//         }
//     }
// }
function generatePrime(bitLength) {
    while (true) {
        const p = Math.floor((Math.random() * bitLength) + 1);
        if (p % 2 === 0)
            continue;
        if (this.isProbablePrime(p, 20))
            return p;
    }
}
function isProbablePrime(n, k) {
    if (n === 2 || n === 3)
        return true;
    if (n <= 1 || n % 2 === 0)
        return false;
    let s = 0;
    let d = n - 1;
    while (d % 2 === 0) {
        d /= 2;
        s++;
    }
    for (let i = 0; i < k; i++) {
        const a = Math.floor(Math.random() * (n - 3)) + 2; // random number between 2 and n-1
        let x = a ** d % n;
        if (x === 1 || x === n - 1)
            continue;
        for (let j = 0; j < s - 1; j++) {
            x = x ** 2 % n;
            if (x === n - 1)
                break;
        }
        if (x !== n - 1)
            return false;
    }
    return true;
}
// picking a random prime number and erasing that prime
// number from list because p!=q
// function pickrandomprime(): number {
//     let k = Math.floor(Math.random() * (prime.size - 1 - 0) + 0 % prime.size);
//     console.log("k is: ", k);
//     const setArray: number[] = [...prime];
//     let ret = setArray[k];
//     prime.delete(ret);
//     console.log("random prime is: ", ret);
//     return ret;
// }
function findGcd(a, b) {
    if (a == 0)
        return b;
    if (b == 0)
        return a;
    // base case
    if (a == b)
        return a;
    // a is greater
    if (a > b)
        return findGcd(a - b, b);
    return findGcd(a, b - a);
}
function setkeys() {
    let prime1 = generatePrime(50); // first prime number
    let prime2 = generatePrime(50); // second prime number
    // to check the prime numbers selected
    console.log("prime 1 is: ", prime1, "prime 2 is: ", prime2);
    n = prime1 * prime2;
    let fi = (prime1 - 1) * (prime2 - 1);
    let e = 2;
    while (1) {
        console.log('to find gcd is: e', e, 'fi: ', fi);
        if (findGcd(e, fi) == 1)
            break;
        e++;
    } // d = (k*Φ(n) + 1) / e for some integer k
    public_key = e;
    let d = 2;
    while (1) {
        if ((d * e) % fi == 1)
            break;
        d++;
    }
    private_key = d;
}
// to encrypt the given number
function encrypt(message) {
    console.log("message is: ", message);
    let e = public_key;
    console.log("e in the encrypt is: ", e);
    let encrpyted_text = 1;
    console.log("encrypted text before loop is", encrpyted_text);
    while (e--) {
        encrpyted_text = encrpyted_text * message;
        // console.log("encrypted text after multiply in the loop is",encrpyted_text);
        encrpyted_text = encrpyted_text % n;
        // console.log("encrypted text after modulo in the loop is",encrpyted_text);
    }
    return encrpyted_text;
}
// to decrypt the given number
function decrypt(message) {
    let e = private_key;
    let decrypted_text = 1;
    while (e--) {
        decrypted_text = decrypted_text * message;
        decrypted_text = decrypted_text % n;
    }
    return decrypted_text;
}
function checkCharIsNumberOrNot(char) {
    console.log("char at check number or not is: ", char);
    const numberArray = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const noOfNumbers = numberArray.filter((item) => item === char);
    return noOfNumbers.length > 0 ? true : false;
}
// first converting each character to its ASCII value and
// then encoding it then decoding the number to get the
// ASCII and converting it to character
function encoder(message) {
    let form = [];
    // calling the encrypting function in encoding function
    for (let i = 0; i < message.length; i++) {
        if (checkCharIsNumberOrNot(message[i])) {
            console.log("number is detected in the string");
            form.push((encrypt(parseInt(message[i]))));
        }
        else {
            form.push(encrypt(message[i].charCodeAt(0)));
        }
    }
    return form;
}
function decoder(encoded) {
    console.log("encoded string in decoder is: ", encoded);
    let s = "";
    let encodedStringArray = encoded.split("-");
    for (let key of encodedStringArray) {
        console.log("decrypt key is: ", decrypt(parseInt(key)));
        if (decrypt(parseInt(key)) < 65) {
            s += decrypt(parseInt(key));
        }
        else {
            s += String.fromCharCode((decrypt(parseInt(key))));
        }
    }
    return s;
}
setkeys();
let message = "~narayan~9864590611~hellowoajajajacdbahaasajajdgdgahaddygebeb";
let coded = encoder(message);
console.log("coded array after encryption is: ", coded);
let encodedString = coded.join('-');
console.log("message to encrypt  is: ", message);
console.log("encode message normal is: ", coded.join(""));
console.log("encoded message new is: ", encodedString);
console.log("decoded message is: ", decoder(encodedString));
