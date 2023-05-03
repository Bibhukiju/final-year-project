import * as crypto from 'crypto'

export class AES {
    sharedSecret: Buffer;
    constructor() {
        console.log("hello")
        const curve = 'secp256k1'
        const alice: crypto.ECDH = crypto.createECDH(curve);

        // ? client 1
        const bob: crypto.ECDH = crypto.createECDH(curve);
        const bobPublicKey: Buffer = bob.generateKeys();

        //  ? client 2
        const alicePublicKey: Buffer = alice.generateKeys();
        const alicePrivateKey: Buffer = alice.getPrivateKey();

        const aliceSharedSecret: Buffer = alice.computeSecret(bobPublicKey);
        const bobSharedSecret: Buffer = bob.computeSecret(alicePublicKey);
        console.log(aliceSharedSecret, " Alice SS");
        console.log(bobSharedSecret, " BSS");


        this.sharedSecret = aliceSharedSecret;

    }
}