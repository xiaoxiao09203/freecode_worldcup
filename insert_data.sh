#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi



# Do not change code above this line. Use the PSQL variable above to query your database.
 echo $($PSQL "TRUNCATE TABLE games, teams")
 cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
 do
 if [[ $year != 'year' ]]
 then
 
 if [[ -z $($PSQL "select team_id from teams where name='$winner' ") ]]
  then 

  insert_winner_result=$($PSQL "insert into teams(name) values('$winner')")
 fi
 if [[ -z $($PSQL "select team_id from teams where name='$opponent' ") ]]
  then 

  insert_opponent_result=$($PSQL "insert into teams(name) values('$opponent')")
 fi

winner_id=$($PSQL "select team_id from teams where name='$winner'")
opponent_id=$($PSQL "select team_id from teams where name='$opponent'")

 insert_games_result=$($PSQL "insert into games(year,winner_id,opponent_id,winner_goals,opponent_goals,round) values($year,$winner_id,$opponent_id,$winner_goals,$opponent_goals,'$round')")


 fi
 done

