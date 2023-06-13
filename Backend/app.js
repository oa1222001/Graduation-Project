const express = require('express')
const dotenv = require('dotenv')
const helmet = require('helmet')
const cors = require('cors')
const xss = require('xss-clean')
const mongoConnect = require('./util/database').mongoConnect;


const errorHandlerMiddleware = require('./middleware/error-handler')
const auth = require('./middleware/auth')

const authRouter = require('./routes/auth')
const requirementRouter = require('./routes/requirement')
const userRouter = require('./routes/user')
const User = require('./model/user')

dotenv.config()

const app = express()

app.use(express.json())


app.set('trust proxy', 1);


// Security Middlwares
app.use(cors())
app.use(helmet())
app.use(xss())

app.use('/auth', authRouter)
app.use('/requirement', requirementRouter)
app.use('/user', auth, userRouter)


app.use((req, res, next) => {

    res.status(404).send('Route does not exist')
})


app.use(errorHandlerMiddleware)


let port = process.env.port || 8080
mongoConnect(() => {
    app.listen(port, async () => {
        console.log('goooooo');
    });
});
