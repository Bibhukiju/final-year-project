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
const plainText = 'In AES, the plaintext is divided into blocks of 128 bits, and each';

const iv = Buffer.from("helloworld123456", 'utf-8')
console.log(iv.toString('hex'))
console.log(bobSharedSecret.toString('base64'));

// Generate a random initialization vector
const aliceCipher = crypto.createCipheriv('aes-256-cbc', aliceSharedSecret, iv);

const encryptedMessage = aliceCipher.update(plainText, 'utf8', 'hex') + aliceCipher.final('hex');
// console.log('first  '  ,encryptedMessage)
const bobDecipher = crypto.createDecipheriv('aes-256-cbc', Buffer.from("667038e1c2197830bb9da5b60a5c144596b97a047f80fd689f496692c3a29ff3", 'hex'), iv);


console.log(bobSharedSecret.toString('base64'), " hello from bob secret key");
console.log(aliceSharedSecret.toString('base64'), " hello from bob secret key");

// const decryptedMessage = bobDecipher.update("a66dc2b7119742da461d5d1ef3e86da2f75318046a84534c1e43d5b6e25250b39884090087ffc73c5be576767a25fddf", 'hex', 'utf8') + bobDecipher.final('utf8');

console.log('Encrypted message: ' + encryptedMessage);
// console.log('Decrypted message: ' + decryptedMessage);

