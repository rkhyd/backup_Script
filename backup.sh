#!/bin/bash

Check if the tst file exists
if test -e /home/user/tst; then
  echo "File exists"
else
  echo "File does not exist"
  exit 1
fi

# Create the backup directory if it doesn't exist
backup_dir="/home/backup"
if [ ! -d "$backup_dir" ]; then
  sudo mkdir "$backup_dir"
fi

# Zip the files and folders mentioned in the TST file
timestamp=$(date +%s%6N) # Get the current timestamp in microseconds
zipfile="$backup_dir/$filename_$timestamp.zip" # Create the filename with timestamp
while read -r line; do
  if [ -e "$line" ]; then
    zip -r "$zipfile" "$line"
  else
    echo "Reached end of the file."
  fi
done < /home/user/tst

