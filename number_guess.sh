#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"

#Get username
echo -n "Enter your username:"
read username

while [[ ${#username} -gt 22 ]]
do 
  echo -e "Username must be 22 characters or less. 
          \nEnter your username:"
  read username
done

#Search username in users database
user_result=$($PSQL "SELECT * FROM users_inf WHERE username = '$username'")
if [[ -z $user_result ]]
then
  echo -e "\nWelcome, $username! It looks like this is your first time here."
else
  games_played=$($PSQL "SELECT COUNT(*) FROM users_inf WHERE username = '$username'")
  best_game=$($PSQL "SELECT MIN(number_of_guesses) FROM users_inf WHERE username = '$username'")
  echo -e "\nWelcome back, $username! You have played $games_played games, and your best game took $best_game guesses." 
fi

#Generate a random number
secret_number=$((RANDOM % 1000 + 1))
echo $secret_number

#Get the guess number
echo -n "Guess the secret number between 1 and 1000:"
read guess_number
#Check if the guess number is a integer
while [[ ! $guess_number =~ ^[0-9]+$ ]]
do
  echo -e "\nThat is not an integer, guess again:"
  read guess_number
done

#Compare guess_number to the secret_number
number_of_guesses=1
while [[ $guess_number -ne $secret_number ]]
do
  if [[ $guess_number -gt $secret_number ]]
  then
    echo -n "It's lower than that, guess again:"
  else 
    echo -n "It's higher than that, guess again:"
  fi
  read guess_number
  #Check if the guess number is a integer
  while [[ ! $guess_number =~ ^[0-9]+$ ]]
  do
    echo -e "\nThat is not an integer, guess again:"
    read guess_number
  done

  ((number_of_guesses++))
done

echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!" 

#Add the game to users_inf table
add_game=$($PSQL "INSERT INTO users_inf(username, number_of_guesses) VALUES('$username', $number_of_guesses)")
