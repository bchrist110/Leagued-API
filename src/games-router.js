const path = require('path')
const express = require('express')
const GamesService = require('./games-service')

const gamesRouter = express.Router()
const jsonParser = express.json()

const serializeGame = game => ({
    id: game.id,
    leagueid: game.leagueid,
    hometeamid: game.hometeamid,
    awayteamid: game.awayteamid,
    date: game.date,
    name: game.name,
    hometeamscore: game.hometeamscore,
    hometeamassists: game.hometeamassists,
    hometeamthrees: game.hometeamthrees,
    hometeamsteals: game.hometeamsteals,
    hometeamblocks: game.hometeamblocks,
    awayteamscore: game.awayteamscore,
    awayteamassists: game.awayteamassists,
    awayteamthrees: game.awayteamthrees,
    awayteamsteals: game.awayteamsteals,
    awayteamblocks: game.awayteamblocks
})

gamesRouter
    .route('/')
    .get((req,res,next) => {
        const knexInstance = req.app.get('db')
        GamesService.getAllGames(knexInstance)
            .then(games => {
                res.json(games.map(serializeGame))
            })
            .catch(next)
    })

gamesRouter
    .route('/:id')
    .all((req,res,next) => {
        GamesService.getById(req.app.get('db'), req.params.id)
        .then(game => {
            if (!game) {
                return res.status(404).json({
                    error: {message: `Game doesn't exist`}
                })
            }
            res.game = game
            next()
        })
        .catch(next)
    })
    .get((req,res,next) => {
        res.json(serializeGame(res.game))
    })
    .patch(jsonParser, (req, res, next) => {
        const { hometeamscore, hometeamassists, hometeamthrees, hometeamsteals, hometeamblocks, awayteamscore, awayteamassists, awayteamthrees, awayteamsteals, awayteamblocks } = req.body
        const gameToUpdate = { hometeamscore, hometeamassists, hometeamthrees, hometeamsteals, hometeamblocks, awayteamscore, awayteamassists, awayteamthrees, awayteamsteals, awayteamblocks }
    
        const numberOfValues = Object.values(gameToUpdate).filter(Boolean).length
        if (numberOfValues === 0)
          return res.status(400).json({
            error: {
              message: `Request body must contain missing element`
            }
          })
        
        GamesService.updateGame(
          req.app.get('db'),
          req.params.id,
          gameToUpdate
        )
          .then(numRowsAffected => {
            res.status(204).end()
          })
          .catch(next)
      })

module.exports = gamesRouter