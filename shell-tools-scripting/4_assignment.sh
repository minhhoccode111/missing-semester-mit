#!/usr/bin/env bash

find ./ -name '*.html' | xargs -d '\n' zip ./4_output.zip

# EXPLAIN:
# find ./ -name '*.html': find all file with .html extension in current dir (recursive)
# |: take the output from the previous command and pass to the next
# xargs: execute commands using STDIN as arguments
# -d '\n': works like string.split("\n") in JavaScript so that xargs will split 
# the stdin to command line arguments by '\n' instead of a space ' ' like normal
# zip ./4_output.zip: zip every .html files found to 4_output.zip
