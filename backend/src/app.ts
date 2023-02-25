import * as express from "express";
import candidateRoutes from "./routes/candidates.routes";
import testRoutes from "./routes/test.routes";
import userRouter from "./routes/user.routes";
import voteRoutes from "./routes/vote.routes";
import { AppDataSource } from "./utils/dataSource";
import { RSA } from "./utils/generatePrime";
import { Request, Response } from "express";


// ? variables
const PORT: any = (process.env.PORT) || 3000;
const app = express();

// ? db connection
AppDataSource.initialize().then(() => { console.log("db initialized") }).catch(e => { console.log(e) })

// ? middlewares
app.use(express.json());

app.use(testRoutes)
app.use(userRouter)
app.use(candidateRoutes)
app.use(voteRoutes);

let rsa = new RSA(32);

console.log(rsa);

const getPublicKey = async (req: Request, res: Response): Promise<Response> => {
    try {
        if (rsa.d && rsa.n) {
            console.log({ message: { e: rsa.e, n: rsa.n } });
            return res.send({ message: { e: rsa.e, n: rsa.n } })
        }
    } catch (error) {
        console.log(error)
    }
}





app.get('/publickey', getPublicKey);

app.listen(PORT, () => {
    console.log(`server is listening at ${PORT}`)
})

