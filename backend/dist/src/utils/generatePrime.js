"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.RSA = void 0;
const big_integer_1 = require("big-integer");
class RSA {
    n;
    e;
    d;
    generatePrime(bitLength) {
        while (true) {
            const p = Math.floor((Math.random() * bitLength) + 1);
            if (p % 2 === 0)
                continue;
            if (this.isProbablePrime(p, 20))
                return p;
        }
    }
    areCoprime(a, b) {
        let gcd = this.findGcd(a, b);
        return gcd === 1;
    }
    findGcd(a, b) {
        if (b === 0) {
            return a;
        }
        else {
            return this.findGcd(b, a % b);
        }
    }
    generateCoPrime(phiOfN) {
        while (true) {
            const e = Math.floor((Math.random() * phiOfN - 2) + 2);
            if (this.areCoprime(e, phiOfN)) {
                return e;
            }
        }
    }
    coPrime(phiOfN) {
        let e = 2;
        while (true) {
            const myGcd = (0, big_integer_1.gcd)(e, phiOfN);
            if (this.findGcd(e, phiOfN) === 1) {
                break;
            }
            e++;
        }
        return e;
    }
    getPrivatekey = (phiOfN, e) => {
        console.log(phiOfN, e, 'PhiOfN and e');
        for (let k = 0; 1 === 1; k++) {
            let operation = (1 + k * phiOfN) / e;
            console.log(operation);
            const remainder = (1 + k * phiOfN) % e;
            if (remainder === 0) {
                return operation;
            }
        }
    };
    generatePrivateKey2(e, phiOfN) {
        let d = 2;
        while (true) {
            if ((d * e) % phiOfN === 1) {
                break;
            }
            d++;
        }
        return d;
    }
    // private modInverse(a: number, m: number): number | null {
    //     // check if a and m are coprime
    //     if (this.gcd(a, m) !== 1) {
    //         return null; // modular inverse doesn't exist
    //     }
    //     // calculate the modular inverse using the extended Euclidean algorithm
    //     let [x, y, u, v] = [0, 1, 1, 0];
    //     while (a !== 0) {
    //         let q = Math.floor(m / a);
    //         let r = m % a;
    //         let x1 = u - q * x;
    //         let y1 = v - q * y;
    //         m = a;
    //         a = r;
    //         u = x;
    //         v = y;
    //         x = x1;
    //         y = y1;
    //     }
    //     // ensure x is positive
    //     if (x < 0) {
    //         x += m;
    //     }
    //     return x;
    // }
    gcd(a, b) {
        if (b === 0) {
            return a;
        }
        else {
            return this.gcd(b, a % b);
        }
    }
    isProbablePrime(n, k) {
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
    constructor(bitLength) {
        let p = this.generatePrime(bitLength);
        let q = this.generatePrime(bitLength);
        while (p === q) {
            p = this.generatePrime(bitLength);
            q = this.generatePrime(bitLength);
            if (p != q) {
                break;
            }
        }
        console.log(p, q, 'this is p and q');
        this.n = p * q;
        const phiOfN = (p - 1) * (q - 1);
        console.log(this.coPrime(phiOfN), 'from new coprime');
        this.e = this.coPrime(phiOfN);
        this.d = this.generatePrivateKey2(this.e, phiOfN);
        console.log(this.d, 'from prev');
        const a = this.generatePrivateKey2(this.e, phiOfN);
        console.log(a, 'from 2');
    }
}
exports.RSA = RSA;
