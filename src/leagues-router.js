const path = require('path')
const express = require('express')
const LeaguesService = require('./leagues-service')

const leaguesRouter = express.Router()
const jsonParser = express.json()

const serializeLeague = league => ({
    id: league.id,
    name: league.name
})

leaguesRouter
    .route('/')
    .get((req,res,next) =>{
        const knexInstance = req.app.get('db')
        LeaguesService.getAllLeagues(knexInstance)
            .then(leagues => {
                res.json(leagues.map(serializeLeague))
            })
            .catch(next)
    })

module.exports = leaguesRouter