#!/bin/bash

# Create a temporary file to store logs from the last three boots
temp_logs=$(mktemp)

# Extract logs from the last three boots
journalctl -b -3 > "$temp_logs"
journalctl -b -2 >> "$temp_logs"
journalctl -b -1 >> "$temp_logs"

# Remove timestamp and other varying parts of each line (adjust the regex as needed)
sed -E 's/^[^ ]+ [^ ]+ [^ ]+ //g' "$temp_logs" > logs_no_timestamp.txt

# Sort and count unique occurrences of each line
sort logs_no_timestamp.txt | uniq -c > counted_logs.txt

# Filter out lines that occur exactly three times (shared between all boots)
awk '$1 != 3' counted_logs.txt | sed 's/^ *[0-9]* //g'

# Clean up temporary files
rm "$temp_logs" logs_no_timestamp.txt counted_logs.txt
