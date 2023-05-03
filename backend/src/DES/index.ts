import * as crypto from 'crypto'

const curve = 'secp256k1';
const alice = crypto.createECDH(curve);
const bob = crypto.createECDH(curve);

// Generate public/private key pairs for Alice and Bob
const alicePublicKey = alice.generateKeys();
const bobPublicKey = bob.generateKeys();
const alicePrivateKey = alice.getPrivateKey();
const bobPrivateKey = bob.getPrivateKey();

// Compute the shared secret key using the other party's public key and our own private key
const aliceSharedSecret = alice.computeSecret(bobPublicKey);
const bobSharedSecret = bob.computeSecret(alicePublicKey);

// Use the shared secret key to encrypt and decrypt data
const message = 'Hello, I am narayan shrestha. I am from rammechhap!';
// const iv = crypto.randomBytes(16)


const hexString = "65666768656667686566676865676668";

const buffer = Buffer.from(hexString, 'hex');

console.log(buffer);

console.log(buffer, "buffer2")
// Generate a random initialization vector
const aliceCipher = crypto.createCipheriv('aes-256-cbc', aliceSharedSecret, buffer);
// console.log(iv.toString('hex'))
// const encryptedMessage = aliceCipher.update(message, 'utf8', 'hex') + aliceCipher.final('hex');
const bobDecipher = crypto.createDecipheriv('aes-256-cbc', Buffer.from("667038e1c2197830bb9da5b60a5c144596b97a047f80fd689f496692c3a29ff3", 'hex'), buffer);


console.log(bobSharedSecret.toString('base64'), " hello from bob secret key");
console.log(aliceSharedSecret.toString('base64'), " hello from bob secret key");

const decryptedMessage = bobDecipher.update("667038e1c2197830bb9da5b60a5c144596b97a047f80fd689f496692c3a29ff3", 'hex', 'utf8') + bobDecipher.final('utf8');

// console.log('Encrypted message: ' + encryptedMessage);
console.log('Decrypted message: ' + decryptedMessage);

