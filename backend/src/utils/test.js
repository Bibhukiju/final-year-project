function generatePrime(bitLength) {
    var min = Math.pow(2, bitLength - 1);
    var max = Math.pow(2, bitLength) - 1;
    console.log(min, max)
    var prime = 0;
    while (prime < min) {
        prime = getRandomInt(min, max);
        console.log(prime,'above if')
        if (isPrime(prime)) {
            console.log(prime)
            return prime;
        }
    }
}

function getRandomInt(min, max) {
    const a =  Math.floor(Math.random() * (max - min + 1)) + min;
    console.log(a ,'from random')
}

function isPrime(n) {
    if (n < 2) {
        return false;
    }
    if (n === 2 || n === 3) {
        return true;
    }
    if (n % 2 === 0) {
        return false;
    }
    var maxDivisor = Math.sqrt(n);
    for (var i = 3; i <= maxDivisor; i += 2) {
        if (n % i === 0) {
            return false;
        }
    }
    return true;
}

const a = generatePrime(15);
console.log(a);