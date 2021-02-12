const GamesService = {
    getAllGames(knex) {
        return knex.select('*').from('games')
    },

    getById(knex, id) {
        return knex
        .from('games')
        .select('*')
        .where('id', id)
        .first()
    },

    updateGame(knex, id, newGameFields) {
        return knex('games')
          .where({ id })
          .update(newGameFields)
    }
}

module.exports = GamesService