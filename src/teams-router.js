const path = require('path')
const express = require('express')
const TeamsService = require('./teams-service')

const teamsRouter = express.Router()
const jsonParser = express.json()

const serializeTeam = team => ({
    id: team.id,
    leagueid: team.leagueid,
    name: team.name
})

teamsRouter
    .route('/')
    .get((req,res,next) => {
        const knexInstance = req.app.get('db')
        TeamsService.getAllTeams(knexInstance)
            .then(teams => {
                res.json(teams.map(serializeTeam))
            })
            .catch(next)
    })

teamsRouter
    .route('/:id')
    .all((req,res,next) => {
        TeamsService.getById(req.app.get('db'), req.params.id)
        .then(team => {
            if (!team) {
                return res.status(404).json({
                    error: {message: `Team doesn't exist`}
                })
            }
            res.team = team
            next()
        })
        .catch(next)
    })
    .get((req,res,next) => {
        res.json(serializeTeam(res.team))
    })

module.exports = teamsRouter