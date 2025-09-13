-- ==================================================
-- THE FOLLOWING CODE CREATES THE BRONZE LAYER TABLES
-- ==================================================

-- drop the tables if they already exist
DROP TABLE IF EXISTS bronze.ball_by_ball;
DROP TABLE IF EXISTS bronze.match;
DROP TABLE IF EXISTS bronze.player;
DROP TABLE IF EXISTS bronze.player_match;
DROP TABLE IF EXISTS bronze.team;
GO

-- create all of these tables
CREATE TABLE bronze.ball_by_ball 
(
match_id INT,
over_id INT,
ball_id INT,
innings_number INT,
batting_team INT,
bowling_team INT,
striker_bating_position INT,
extra_type NVARCHAR(50),
runs_scored INT,
extra_runs INT,
wides INT,
leg_byes INT,
byes INT,
no_balls INT,
penalty INT,
bowler_extras INT,
out_type INT,
caught INT,
bowled INT,
run_out INT,
lbw INT,
retired_hurt INT,
stumped INT,
caught_and_bowled INT,
hit_wicket INT,
obstructing_field INT,
bowler_wicket INT,
match_date DATE,
season INT,
striker INT,
non_striker INT,
bowler INT,
player_out INT,
fielder INT,
striker_match_sk INT,
striker_sk INT,
non_striker_match_sk INT,
non_striker_sk INT,
fielder_match_sk INT,
fielder_sk INT,
bowler_match_sk INT,
bowler_sk INT,
player_out_match_sk INT,
batting_team_sk INT,
bowling_team_sk INT,
keeper_catch INT,
player_out_sk INT,
match_date_sk DATE
);
GO

CREATE TABLE bronze.match
(
match_sk INT,
match_id INT,
team1 NVARCHAR(50),
team2 NVARCHAR(50),
match_date DATE,
season_year INT,
venue_name NVARCHAR(50),
city_name NVARCHAR(50),
country_name NVARCHAR(50),
toss_winner NVARCHAR(50),
match_winner NVARCHAR(50),
toss_name NVARCHAR(50),
win_type NVARCHAR(50),
outcome_type NVARCHAR(50),
man_of_match NVARCHAR(50),
win_margin INT,
country_id INT
);
GO

CREATE TABLE bronze.player 
(
player_sk INT,
player_id INT,
player_name NVARCHAR(50),
dob DATE,
batting_hand NVARCHAR(50),
bowling_skill NVARCHAR(50),
country_name NVARCHAR(50)
);
GO

CREATE TABLE player_match (
    player_match_sk      INT,
    player_match_key     INT,
    match_id             INT,
    player_id            INT,
    player_name          NVARCHAR(50),
    dob                  DATE,
    batting_hand         NVARCHAR(50),
    bowling_skill        NVARCHAR(50),
    country_name         NVARCHAR(50),
    role_desc            NVARCHAR(50),
    player_team          NVARCHAR(50),
    opposit_team         NVARCHAR(50),
    season_year          INT,
    is_man_of_the_match  INT,
    age_as_on_match      INT,
    is_players_team_won  INT,
    batting_status       NVARCHAR(50),
    bowling_status       NVARCHAR(50),
    player_captain       NVARCHAR(50),
    opposit_captain      NVARCHAR(50),
    player_keeper        NVARCHAR(50),
    opposit_keeper       NVARCHAR(50)
);
GO

CREATE TABLE bronze.team
(
team_sk INT,
team_id INT,
team_name NVARCHAR(50)
);
GO
