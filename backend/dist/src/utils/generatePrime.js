"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.RSA = void 0;
class RSA {
    n;
    e = 35;
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
    getPrivatekey = (phiOfN, e) => {
        console.log(phiOfN, e, 'hello from ');
        for (let k = 0; 1 === 1; k++) {
            let operation = (1 + k * phiOfN) / e;
            console.log(operation);
            const remainder = (1 + k * phiOfN) % e;
            if (remainder === 0) {
                return operation;
            }
        }
    };
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
        const p = this.generatePrime(bitLength);
        const q = this.generatePrime(bitLength);
        this.n = p * q;
        const phiOfN = (p - 1) * (q - 1);
        this.e = this.generateCoPrime(phiOfN);
        this.d = this.getPrivatekey(phiOfN, this.e);
        console.log(this.d, 'hello');
        let a = 'mango';
    }
}
exports.RSA = RSA;
