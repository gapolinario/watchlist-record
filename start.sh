#!/bin/bash

echo "Where do you want to save your data files?"
read folder

echo "What is your Letterboxd username?"
read user

printf "Date,Number\n" > $folder/watchRecord.csv

printf "folder: $folder\nuser: $user\n" > config
