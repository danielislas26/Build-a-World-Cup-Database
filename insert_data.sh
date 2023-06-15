#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS=',' read YEAR ROUND WINNER_NAME OPPONENT_NAME WINNER_GOALS OPPONENT_GOALS
  do 
    if [[ $WINNER_NAME != "winner" ]]
      then
        # get team_id
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_NAME' ")
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_NAME' ")

        GAME_ID=$($PSQL "SELECT game_id FROM games FULL JOIN teams ON games.winner_id=teams.team_id WHERE year=$YEAR AND winner_id=$WINNER_ID  AND opponent_id=$OPPONENT_ID" ) 
        
        #--------------------------------- INSERT THE TEAMS_NAMES FROM THE teams TABLE BY winner_id WHITH WINNER_ID -------------------------------------------
        # if not found
        if [[ -z $WINNER_ID ]]
        then 

          # insert name
          INSERT_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER_NAME')")
          if [[ $INSERT_NAME == "INSERT 0 1" ]]
          then
            echo Inserted into teams, $WINNER_NAME 
          fi

          # Get new team_id
          WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_NAME' ")
        fi


        #----------------------------------- INSERT THE TEAMS_NAMES FROM THE teams TABLE BY winner_id WHIT OPPONENT_ID -------------------------------------
                # if not found
        if [[ -z $OPPONENT_ID ]]
        then 

          # insert name
          INSERT_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT_NAME')")
          if [[ $INSERT_NAME == "INSERT 0 1" ]]
          then
            echo Inserted into teams, $OPPONENT_NAME 
          fi

          # Get new team_id
          OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_NAME' ")
        fi

        #------------------------------------- INSERT ROWS ----------------------------------------------------------------------------------------

        # if not fount
        if [[ -z $GAME_ID ]]
        then
          # insert row{year,round,winner_id,opponent_id,winner_goals,opponent_goals
          INSERT_ROW=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
          if [[ $INSERT_ROW == "INSERT 0 1" ]]
          then 
            echo Inserted into games  $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS 
          fi

          # Get new game_id
          GAME_ID=$($PSQL "SELECT game_id FROM games FULL JOIN teams ON games.winner_id=teams.team_id WHERE year=$YEAR AND winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID" )

        fi

        


     
      
    fi
  done
