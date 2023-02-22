import * as express from "express";
import candidateRoutes from "./routes/candidates.routes";
import userRouter from "./routes/user.routes";
import voteRoutes from "./routes/vote.routes";
import { AppDataSource } from "./utils/dataSource";



// ? variables
const PORT: any = (process.env.PORT) || 3000;
const app = express();

// ? db connection
AppDataSource.initialize().then(() => { console.log("db initialized") }).catch(e => { console.log(e) })

// ? middlewares
app.use(express.json());
app.use(userRouter)
app.use(candidateRoutes)
app.use(voteRoutes)



app.listen(PORT, () => {
    console.log(`server is listening at ${PORT}`)
})