// Update with your config settings.

module.exports = {

  development: {
    client: 'pg',
    connection: {
      host: '127.0.0.1',
      user: 'postgres',
      password: 'awesome1',
      database: 'leagued',
    },
  },

  staging: {
    client: 'postgresql',
    connection: {
      database: 'leagued',
      user:     'postgres',
      password: 'awesome1'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  },

  production: {
    client: 'postgresql',
    connection: {
      database: 'postgres',
      user:     'postgres.awprjqfxkwcptcizinza',
      password: 'Qd2Ka!Q3B*.K$Bq'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  }

};
