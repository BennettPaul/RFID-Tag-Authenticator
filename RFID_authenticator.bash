#!/bin/bash

AUTH_FILE="auth.txt"
LOG_FILE="scan.log"
SUCCESS_SCRIPT="./success.sh"

# Read the hex value from input
read -r hexdata

# Get the current Unix timestamp
timestamp=$(date +%s)

# Look up the hex value in the auth file
match=$(grep "^$hexdata " "$AUTH_FILE")

if [ -n "$match" ]; then
    user="${match#* }"
    echo "$timestamp $user SUCCESS" >> "$LOG_FILE"
    $SUCCESS_SCRIPT "$hexdata" "$user"
else
    echo "$timestamp $hexdata FAILURE" >> "$LOG_FILE"
fi
