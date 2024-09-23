#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate random #
SECRET_NUMBER=$((1 + RANDOM % 1000))
echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

# prompt for username
echo "Enter your username:"
read USERNAME

# query username
QUERY_USER="WHERE username='$USERNAME'"
PLAYER_ID=$($PSQL "SELECT player_id FROM players $QUERY_USER")

if [[ -z $PLAYER_ID ]]
then 
  NEW_PLAYER=$($PSQL "INSERT INTO players(username, games_played, best_game) VALUES('$USERNAME', 1, 0)")
  echo Welcome, $USERNAME! It looks like this is your first time here.
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players $QUERY_USER")
  BEST_GAME=$($PSQL "SELECT best_game FROM players $QUERY_USER")
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.

  # increment game and save
  GAMES_PLAYED=$(( GAMES_PLAYED + 1 )) 
  ADD_GAME=$($PSQL "UPDATE players SET games_played = $GAMES_PLAYED $QUERY_USER")
fi

# game module
echo -e "\nGuess the secret number between 1 and 1000:"
NUMBER_OF_GUESSES=0

while true;
do
  read GUESS  
  NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))

  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    STORED_BEST_GAME=$($PSQL "SELECT best_game FROM players $QUERY_USER")
    if [[ $STORED_BEST_GAME -eq 0 ]] || [[ $STORED_BEST_GAME -gt $NUMBER_OF_GUESSES ]]
    then
      ADD_BEST_GAME=$($PSQL "UPDATE players SET best_game=$NUMBER_OF_GUESSES $QUERY_USER")
    fi
    break
  
  elif [[ $GUESS -gt $SECRET_NUMBER ]] && [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "It's lower than that, guess again:"
  
  elif [[ $GUESS -lt $SECRET_NUMBER ]] && [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "It's higher than that, guess again:"

  else
    echo "That is not an integer, guess again:"
  fi
done



