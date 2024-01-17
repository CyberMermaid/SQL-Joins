-- write your queries here

--Part Two: SQL Zoo Step 6--
-- Modify query to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER' --
SELECT matchid, player FROM goal 
  JOIN eteam 
  on goal.teamid = eteam.id
  WHERE teamid = 'GER';

-- Show id, stadium, team1, team2 for just game 1012--
SELECT id,stadium,team1,team2
  FROM game
  JOIN goal
  ON game.id = goal.matchid 
  WHERE id = 1012
  LIMIT 1;

-- Modify it to show the player, teamid, stadium and mdate for every German goal.--
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (game.id=goal.matchid)
  WHERE teamid = 'GER';

--Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'--
  SELECT team1, team2, player
  FROM game JOIN goal ON (game.id=goal.matchid)
  WHERE player LIKE 'Mario%';
  
--Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10 --
SELECT player, teamid, coach, gtime
  FROM goal
  JOIN eteam
  ON teamid = id
 WHERE gtime<=10;

-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach. --
SELECT mdate, teamname
  FROM game  
  JOIN eteam 
  ON team1 = eteam.id
  WHERE eteam.coach = 'Fernando Santos';

-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'--
SELECT player
  FROM goal 
  JOIN game 
  ON goal.matchid = game.id
  WHERE stadium = 'National Stadium, Warsaw';
  
--Show the name of all players who scored a goal against Germany.--  
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
  WHERE (team1='GER' OR team2='GER') 
  AND teamid != 'GER';

--Show teamname and the total number of goals scored. --  
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
 
--Show the stadium and the number of goals scored in each stadium. --
SELECT stadium, COUNT(*)
 FROM game 
 JOIN goal ON id = matchid
 GROUP BY stadium

--For every match involving 'POL', show the matchid, date and the number of goals scored.--
SELECT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON matchid = id 
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid

-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER' --
SELECT matchid, mdate, COUNT(teamid)
 FROM game JOIN goal ON game.id = goal.matchid 
 WHERE (team1 = 'GER' or team2 = 'GER') AND teamid = 'GER'
 GROUP BY matchid;
 --Sort your result by mdate, matchid, team1 and team2.--
 SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  sum(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
 FROM game LEFT JOIN goal ON matchid = id
 GROUP BY mdate, matchid, team1, team2
 ORDER BY mdate, matchid, team1, team2;
 --Step 7-
 
 --List the films where the yr is 1962 [Show id, title]--
 SELECT id, title
 FROM movie
 WHERE yr=1962
-- Give year of 'Citizen Kane'.--
SELECT yr 
 FROM movie
 WHERE title = 'Citizen Kane';
 --List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.--
 SELECT id, title, yr
 FROM movie
 WHERE title LIKE 'Star Trek%'
 ORDER BY yr;
--What id number does the actor 'Glenn Close' have? --
SELECT DISTINCT id
 FROM actor JOIN casting 
 ON actor.id = casting.actorid
 WHERE actor.name = 'Glenn Close'; 
 -- What is the id of the film 'Casablanca'--
 SELECT id 
 FROM movie
 WHERE title = 'Casablanca';
 
