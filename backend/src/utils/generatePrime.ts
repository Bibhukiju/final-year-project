export class RSA {
    n: number;
    e: number = 35;
    d: number;

    private generatePrime(bitLength: number) {
        while (true) {
            const p: number = Math.floor((Math.random() * bitLength) + 1);
            if (p % 2 === 0) continue;
            if (this.isProbablePrime(p, 20))
                return p;
        }
    }

    private areCoprime(a: number, b: number): boolean {
        let gcd = this.findGcd(a, b);
        return gcd === 1;
    }

    private findGcd(a: number, b: number): number {
        if (b === 0) {
            return a;
        } else {
            return this.findGcd(b, a % b);
        }
    }
    private generateCoPrime(phiOfN: number): number {
        while (true) {
            const e = Math.floor((Math.random() * phiOfN - 2) + 2);
            if (this.areCoprime(e, phiOfN)) {
                return e;
            }
        }
    }

    private getPrivatekey = (phiOfN: number, e: number) => {
        console.log(phiOfN, e, 'hello from ')
        for (let k = 0; 1 === 1; k++) {
            let operation = (1 + k * phiOfN) / e;
            console.log(operation);
            const remainder: any = (1 + k * phiOfN) % e;
            if (remainder === 0) {
                return operation;
            }
        }
    }

    private isProbablePrime(n: number, k: number): boolean {
        if (n === 2 || n === 3) return true;
        if (n <= 1 || n % 2 === 0) return false;

        let s = 0;
        let d = n - 1;

        while (d % 2 === 0) {
            d /= 2;
            s++;
        }

        for (let i = 0; i < k; i++) {
            const a = Math.floor(Math.random() * (n - 3)) + 2; // random number between 2 and n-1
            let x = a ** d % n;

            if (x === 1 || x === n - 1) continue;

            for (let j = 0; j < s - 1; j++) {
                x = x ** 2 % n;
                if (x === n - 1) break;
            }

            if (x !== n - 1) return false;
        }

        return true;
    }

    constructor(bitLength: number) {
        const p: number = this.generatePrime(bitLength);
        const q: number = this.generatePrime(bitLength);


        this.n = p * q;

        const phiOfN: number = (p - 1) * (q - 1);
        this.e = this.generateCoPrime(phiOfN);
        this.d = this.getPrivatekey(phiOfN, this.e);
        console.log(this.d, 'hello')
        let a: string = 'mango';


    }
}

