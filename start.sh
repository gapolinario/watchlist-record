#!/bin/bash

echo "Where do you want to save your data files?"
read folder

echo "What is your Letterboxd username?"
read user

printf "Date,Number\n" > $folder/watchRecord.csv

printf "folder: $folder\nuser: $user\n" > config

# make a bash executable folder and copy it to
# cron.weekly, this might work

# printf("#!/bin/bash\nmake -C $folder all")

# or something like this,
# in fact it's better to set up a different
# make command, like make set_cron
