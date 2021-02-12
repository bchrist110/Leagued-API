const TeamsService = {
    getAllTeams(knex) {
        return knex.select('*').from('teams')
    },
    
    getById(knex, id) {
        return knex
        .from('teams')
        .select('*')
        .where('id', id)
        .first()
    }
}

module.exports = TeamsService