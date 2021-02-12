const LeaguesService = {
    getAllLeagues(knex) {
        return knex.select('*').from('leagues')
    }
}

module.exports = LeaguesService