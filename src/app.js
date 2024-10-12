require('dotenv').config()
const express = require('express')
const morgan = require('morgan')
const cors = require('cors')
const helmet = require('helmet')
const { NODE_ENV } = require('./config')
const leaguesRouter = require('./leagues-router')
const teamsRouter = require('./teams-router')
const gamesRouter = require('./games-router')
const playersRouter = require('./players-router')

const app = express()

const morganOption = (NODE_ENV === 'production')
  ? 'tiny'
  : 'common';

app.use(morgan(morganOption))
app.use(helmet())
app.use(cors({
    origin: '*', // Allow all origins (for testing purposes)
    credentials: false,
  }));

app.use('/api/leagues', leaguesRouter)
app.use('/api/teams', teamsRouter)
app.use('/api/games', gamesRouter)
app.use('/api/players', playersRouter)

app.get('/xss', (req, res) => {
    res.cookie('secretToken', '1234567890');
    res.sendFile(__dirname + '/xss-example.html');
  });

app.get('/', (req, res) => {
    res.send('Hello, world!')
})

app.use(function errorHandler(error, req, res, next) {
    let response
    if (NODE_ENV === 'production') {
        response = { error: { message: 'server error' } }
    } else {
        console.error(error)
        response = { message: error.message, error }
    }
    res.status(500).json(response)
})

module.exports = app