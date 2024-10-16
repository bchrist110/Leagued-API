CREATE TABLE IF NOT EXISTS leagues (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS teams (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    leagueId INTEGER REFERENCES leagues(id) ON DELETE CASCADE NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS games (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    leagueId INTEGER REFERENCES leagues(id) ON DELETE CASCADE NOT NULL,
    homeTeamId INTEGER REFERENCES teams(id) ON DELETE CASCADE NOT NULL,
    awayTeamId INTEGER REFERENCES teams(id) ON DELETE CASCADE NOT NULL,
    date TEXT NOT NULL,
    name TEXT NOT NULL,
    homeTeamScore INTEGER NOT NULL,
    homeTeamAssists INTEGER NOT NULL,
    homeTeamThrees INTEGER NOT NULL,
    homeTeamSteals INTEGER NOT NULL,
    homeTeamBlocks INTEGER NOT NULL,
    awayTeamScore INTEGER NOT NULL,
    awayTeamAssists INTEGER NOT NULL,
    awayTeamThrees INTEGER NOT NULL,
    awayTeamSteals INTEGER NOT NULL,
    awayTeamBlocks INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS players (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    leagueId INTEGER REFERENCES leagues(id) ON DELETE CASCADE NOT NULL,
    teamId INTEGER REFERENCES teams(id) ON DELETE CASCADE NOT NULL,
    role TEXT NOT NULL,
    city TEXT NOT NULL,
    phone TEXT NOT NULL,
    name TEXT NOT NULL
);