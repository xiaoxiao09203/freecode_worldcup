#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "select sum(winner_goals)+sum(opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "select avg(winner_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "select round(avg(winner_goals),2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "select round(avg(winner_goals),16)+round(avg(opponent_goals),16) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "select max(winner_goals) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT count(*) FROM GAMes where winner_goals>2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select name from games join teams on winner_id=team_id where year=2018 and round='Final' order by name")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select a.name from games join teams as a on winner_id=a.team_id or opponent_id=team_id where year=2014 and round='Eighth-Final' order by name")"


echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct name from games join teams on winner_id=team_id order by name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select year, name from games join teams on winner_id=team_id where round='Final' order by year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select  name from games join teams on winner_id=team_id where name like 'Co%' order by name")"