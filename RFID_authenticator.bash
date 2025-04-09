#!/bin/bash

# Files
AUTH_FILE="auth.txt"
LOG_FILE="scan.log"
SUCCESS_SCRIPT="./success.sh"

# Read input from stdin or a file
while read -r line; do
    # Parse line using regex
    if [[ $line =~ ^([0-9]+)\ Read\ [0-9]+\ bits\ \([0-9]+\ bytes\):\ ([A-F0-9]+)\ :\ ([01]+)$ ]]; then
        timestamp="${BASH_REMATCH[1]}"
        hexdata="${BASH_REMATCH[2]}"
        
        # Look up hex data in auth file
        match=$(grep "^$hexdata " "$AUTH_FILE")
        
        if [ -n "$match" ]; then
            user="${match#* }"
            echo "$timestamp $user SUCCESS" >> "$LOG_FILE"
            $SUCCESS_SCRIPT "$hexdata" "$user"
        else
            echo "$timestamp $hexdata FAILURE" >> "$LOG_FILE"
        fi
    else
        echo "Invalid input format: $line" >&2
    fi
done < "${1:-/dev/stdin}"
