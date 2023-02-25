"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
const candidates_routes_1 = require("./routes/candidates.routes");
const test_routes_1 = require("./routes/test.routes");
const user_routes_1 = require("./routes/user.routes");
const vote_routes_1 = require("./routes/vote.routes");
const dataSource_1 = require("./utils/dataSource");
const generatePrime_1 = require("./utils/generatePrime");
// ? variables
const PORT = (process.env.PORT) || 3000;
const app = express();
// ? db connection
dataSource_1.AppDataSource.initialize().then(() => { console.log("db initialized"); }).catch(e => { console.log(e); });
// ? middlewares
app.use(express.json());
app.use(test_routes_1.default);
app.use(user_routes_1.default);
app.use(candidates_routes_1.default);
app.use(vote_routes_1.default);
let rsa = new generatePrime_1.RSA(32);
console.log(rsa);
const getPublicKey = async (req, res) => {
    try {
        if (rsa.d && rsa.n) {
            console.log({ message: { e: rsa.e, n: rsa.n } });
            return res.send({ message: { e: rsa.e, n: rsa.n } });
        }
    }
    catch (error) {
        console.log(error);
    }
};
app.get('/publickey', getPublicKey);
app.listen(PORT, () => {
    console.log(`server is listening at ${PORT}`);
});
