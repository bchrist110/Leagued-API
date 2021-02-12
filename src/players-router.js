const path = require('path')
const express = require('express')
const PlayersService = require('./players-service')

const playersRouter = express.Router()
const jsonParser = express.json()

const serializePlayers = player => ({
    id: player.id,
    leagueid: player.leagueid,
    teamid: player.teamid,
    role: player.role,
    city: player.city,
    phone: player.phone,
    name: player.name
})

playersRouter
    .route('/')
    .get((req,res,next) => {
        const knexInstance= req.app.get('db')
        PlayersService.getAllPlayers(knexInstance)
            .then(players => {
                res.json(players.map(serializePlayers))
            })
            .catch(next)
    })

playersRouter
    .route('/:id')
    .all((req,res,next) => {
        PlayersService.getById(req.app.get('db'), req.params.id)
        .then(player => {
            if (!player) {
                return res.status(404).json({
                    error: {message: `Player doesn't exist`}
                })
            }
            res.player = player
            next()
        })
        .catch(next)
    })
    .get((req,res,next) => {
        res.json(serializePlayers(res.player))
    })

module.exports = playersRouter