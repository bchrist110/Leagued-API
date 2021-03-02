const { expect } = require('chai')
const knex = require('knex')
const app = require('../src/app')

describe('App Endpoints', function() {
    let db

  before('make knex instance', () => {
    db = knex({
      client: 'pg',
      connection: process.env.TEST_DB_URL,
    })
    app.set('db', db)
  })

  after('disconnect from db', () => db.destroy())

  before('clean the table', () => db('leagued').truncate())

  context('Given there is data in the database', () => {
    const testLeagues = [
        {
            "id": 1,
            "name": "Tater Tots (8-10)"
        },
        {
            "id": 2,
            "name": "Flyers (11-12)"
        },
        {
            "id": 3,
            "name": "Trappers (13-15)"
        }
    ]

    const testTeams = [
        {
            "id": 1,
            "leagueid": 1,
            "name": "Supers"
        },
        {
            "id": 2,
            "leagueid": 1,
            "name": "Importants"
        },
        {
            "id": 3,
            "leagueid": 1,
            "name": "Spangleys"
        }
    ]

    const testGames = [
        {
            "id": 1,
            "leagueid": 1,
            "hometeamid": 1,
            "awayteamid": 2,
            "date": "1/1",
            "name": "Game 1",
            "hometeamscore": 50,
            "hometeamassists": 5,
            "hometeamthrees": 4,
            "hometeamsteals": 5,
            "hometeamblocks": 4,
            "awayteamscore": 40,
            "awayteamassists": 5,
            "awayteamthrees": 4,
            "awayteamsteals": 5,
            "awayteamblocks": 6
        },
        {
            "id": 3,
            "leagueid": 1,
            "hometeamid": 1,
            "awayteamid": 3,
            "date": "1/2",
            "name": "Game 2",
            "hometeamscore": 23,
            "hometeamassists": 1,
            "hometeamthrees": 1,
            "hometeamsteals": 1,
            "hometeamblocks": 1,
            "awayteamscore": 34,
            "awayteamassists": 1,
            "awayteamthrees": 1,
            "awayteamsteals": 1,
            "awayteamblocks": 3
        }
    ]

    const testPlayers = [
        {
            "id": 1,
            "leagueid": 1,
            "teamid": 1,
            "role": "Player",
            "city": "Bellevue",
            "phone": "(298)234-4897",
            "name": "Jimmy Taylor"
        },
        {
            "id": 2,
            "leagueid": 1,
            "teamid": 1,
            "role": "Player",
            "city": "Redmond",
            "phone": "(298)234-2397",
            "name": "Tim Donald"
        }
    ]
    
    beforeEach('insert leagues', () => {
       return db
        .into('leagues')
        .insert(testLeagues)
    })
    beforeEach('insert teams', () => {
        return db
         .into('teams')
         .insert(testTeams)
    })
    beforeEach('insert games', () => {
        return db
         .into('games')
         .insert(testGames)
    })
    beforeEach('insert players', () => {
        return db
         .into('players')
         .insert(testPlayers)
    })

    it('GET /leagues responds with 200 and all of the leagues', () => {
        return supertest(app)
            .get('/leagues')
            .expect(200, testLeagues)
        })
    it('GET /teams responds with 200 and all of the teams', () => {
        return supertest(app)
            .get('/teams')
            .expect(200, testTeams)
        })
    it('GET /games responds with 200 and all of the games', () => {
        return supertest(app)
            .get('/games')
            .expect(200, testGames)
        })
    it('GET /players responds with 200 and all of the players', () => {
        return supertest(app)
            .get('/players')
            .expect(200, testPlayers)
        })
    
    afterEach('cleanup', () => db('leagued').truncate())
  })
})