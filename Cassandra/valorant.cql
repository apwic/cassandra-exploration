CREATE KEYSPACE valorant
WITH REPLICATION = { 
    'class' : 'NetworkTopologyStrategy',
    'replication_factor' : 3 
};

USE KEYSPACE valorant;

-- Table Games

CREATE TABLE IF NOT EXISTS Games (
    GameID varchar PRIMARY KEY,
    MatchID varchar,
    Map varchar,
    Team1ID int,
    Team2ID int,
    Team1 varchar,
    Team2 varchar,
    Winner varchar,
    Team1_TotalRounds int,
    Team2_TotalRounds int,
    Team1_SideFirstHalf varchar,
    Team2_SideFirstHalf varchar,
    Team1_RoundsFirstHalf int,
    Team1_RoundsSecondtHalf int,
    Team1_RoundsOT int,
    Team2_RoundsFirstHalf int,
    Team2_RoundsSecondtHalf int,
    Team2_RoundsOT int,
    Team1_PistolWon int,
    Team1_Eco int,
    Team1_EcoWon int,
    Team1_SemiEco int,
    Team1_SemiEcoWon int,
    Team1_SemiBuy int,
    Team1_SemiBuyWon int,
    Team1_FullBuy int,
    Team1_FullBuyWon int,
    Team2_PistolWon int,
    Team2_Eco int,
    Team2_EcoWon int,
    Team2_SemiEco int,
    Team2_SemiEcoWon int,
    Team2_SemiBuy int,
    Team2_SemiBuyWon int,
    Team2_FullBuy int,
    Team2_FullBuyWon int,
);

COPY Games (GameID, MatchID, Map, Team1ID, Team2ID, Team1, Team2, Winner, Team1_TotalRounds, Team2_TotalRounds, Team1_SideFirstHalf, Team2_SideFirstHalf, Team1_RoundsFirstHalf, Team1_RoundsSecondtHalf, Team1_RoundsOT, Team2_RoundsFirstHalf, Team2_RoundsSecondtHalf, Team2_RoundsOT, Team1_PistolWon, Team1_Eco, Team1_EcoWon, Team1_SemiEco, Team1_SemiEcoWon, Team1_SemiBuy, Team1_SemiBuyWon, Team1_FullBuy, Team1_FullBuyWon, Team2_PistolWon, Team2_Eco, Team2_EcoWon, Team2_SemiEco, Team2_SemiEcoWon, Team2_SemiBuy, Team2_SemiBuyWon, Team2_FullBuy, Team2_FullBuyWon)
FROM '/Data/games.csv'
WITH HEADER = TRUE;

-- Table Game_Rounds

CREATE TABLE IF NOT EXISTS Game_Rounds (
    GameID varchar,
    Team1ID int,
    Team2ID int,
    RoundHistory text
);

COPY Game_Rounds (GameID, Team1ID, Team2ID, RoundHistory)
FROM '/Data/game_rounds.csv'
WITH HEADER = TRUE;

-- Table Game_Scoreboards

CREATE TABLE IF NOT EXISTS Game_Scoreboard (
    GameID varchar,
    PlayerID varchar,
    PlayerName varchar,
    TeamAbbreviation varchar,
    Agent varchar,
    ACS int,
    Kills int,
    Deaths int,
    Assists int,
    PlusMinus int,
    KAST_Percent REAL,
    ADR int,
    HS_Percent REAL,
    FirstKills int,
    FirstDeaths int,
    FKFD_PlusMinus int,
    Num_2Ks int,
    Num_3Ks int,
    Num_4Ks int,
    Num_5Ks int,
    OnevOne int,
    OnevTwo int,
    OnevThree int,
    OnevFour int,
    OnevFive int,
    Econ int,
    Plants int,
    Defuses int,
);

COPY Game_Scoreboard (GameID, PlayerID, PlayerName, TeamAbbreviation, Agent, ACS, Kills, Deaths, Assists, PlusMinus, KAST_Percent, ADR, HS_Percent, FirstKills, FirstDeaths, FKFD_PlusMinus, Num_2Ks, Num_3Ks, Num_4Ks, Num_5Ks, OnevOne, OnevTwo, OnevThree, OnevFour, OnevFive, Econ, Plants, Defuses)
FROM 'Data/game_scoreboard.csv'
WITH HEADER = TRUE;

-- Table Matches

CREATE TABLE IF NOT EXISTS Matches (
    MatchID varchar,
    Date date,
    Patch text,
    EventID varchar,
    EventName varchar,
    EventStage varchar,
    Team1ID int,
    Team2ID int,
    Team1 varchar,
    Team2 varchar,
    Team1_MapScore int,
    Team2_MapScore int,
);

COPY Matches (MatchID, Date, Patch, EventID, EventName, EventStage, Team1ID, Team2ID, Team1, Team2, Team1_MapScore, Teamp2_MapScore)
FROM 'Data/matches.csv'
WITH HEADER = TRUE;










