"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.generatePrimes = void 0;
const generatePrimes = (min, max) => {
    let primes = [];
    for (let i = min; i <= max; i++) {
        let isPrime = true;
        for (let j = 2; j < i; j++) {
            if (i % j === 0) {
                isPrime = false;
                break;
            }
        }
        if (isPrime) {
            primes.push(i);
        }
    }
    return primes;
};
exports.generatePrimes = generatePrimes;
