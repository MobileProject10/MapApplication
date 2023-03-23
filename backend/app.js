const express = require('express')
require('dotenv').config()

const app = express()

const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');

app.use(express.json());

app.use(cors());
app.use(morgan("dev"));
app.use(helmet());

const auth = require('./misc/auth');

const userRouter = require('./routes/userRoutes')
const userAuthRouter = require('./routes/userAuthRoutes')

app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Internal server error, check console')
})

app.use('/user', userRouter);

app.use(auth);

app.use('/user', userAuthRouter);


module.exports = app;