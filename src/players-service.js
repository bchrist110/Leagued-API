const PlayersService = {
    getAllPlayers(knex) {
        return knex.select('*').from('players')
    },

    getById(knex, id) {
        return knex
        .from('players')
        .select('*')
        .where('id', id)
        .first()
    }
}

module.exports = PlayersService