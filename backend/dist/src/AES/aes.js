"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AES = void 0;
const crypto = require("crypto");
class AES {
    sharedSecret;
    constructor() {
        console.log("hello");
        const curve = 'secp256k1';
        const alice = crypto.createECDH(curve);
        // ? client 1
        const bob = crypto.createECDH(curve);
        const bobPublicKey = bob.generateKeys();
        //  ? client 2
        const alicePublicKey = alice.generateKeys();
        const alicePrivateKey = alice.getPrivateKey();
        const aliceSharedSecret = alice.computeSecret(bobPublicKey);
        const bobSharedSecret = bob.computeSecret(alicePublicKey);
        console.log(aliceSharedSecret, " Alice SS");
        console.log(bobSharedSecret, " BSS");
        this.sharedSecret = aliceSharedSecret;
    }
}
exports.AES = AES;
