#!/bin/env bash

# log server, tsp is the name of the server that the instructor is trying to connect
ssh tsp journalctl

# pipe to grep
ssh tsp journalctl | grep ssh

# pipe to another grep
ssh tsp journalctl | grep ssh | grep "Disconnected from"

# waste to send the whole thing from the server, so we can run the whole thing on the server and only send the result to us
ssh tsp 'journalctl | grep ssh | grep "Disconnected from"'

# and pipe through less
ssh tsp 'journalctl | grep ssh | grep "Disconnected from" | head -n300' | less

# write the result to a file
ssh tsp 'journalctl | grep ssh | grep "Disconnected from"' > ssh.log 

# remove everything that come before "Disconnected from"
cat ssh.log | sed 's/.*Disconnected from //' | less

# example
echo 'aba' | sed 's/[ab]//' # out: ba

# pass -E to use (ab) instead of \(ab\)
echo 'abcaba' | sed -E 's/(ab)*//g' # out: ca

echo 'abcababc' | sed -E 's/(ab|bc)*//g' # out: cc

echo 'abcabbc' | sed -E 's/(ab|bc)*//g' # out: c

cat ssh.log | sed 's/.*Disconnected from //' | head -n5

# try to remove the whole line
cat ssh.log | sed -E 's/^.*Disconnected from (invalid |authenticating )?user .* [0-9.]+ port [0-9]+( \[preauth\])?$//'

# try to keep only the username
cat ssh.log | sed -E 's/^.*Disconnected from (invalid |authenticating )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?$/\2/'

# make this no-greedy with the .*? - mean that the moment we hit the "Disconnected" keyword, we start parsing the rest of the pattern
cat ssh.log | sed -E 's/^.*?Disconnected from (invalid |authenticating )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?$/\2/'

# count lines
# wc is stand for word count and -l is count new line
cat ssh.log | sed -E 's/^.*?Disconnected from (invalid |authenticating )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?$/\2/' | wc -l

# or sort the output
cat ssh.log | sed -E 's/^.*?Disconnected from (invalid |authenticating )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?$/\2/' | sort

# then remove duplicate 
cat ssh.log | sed -E 's/^.*?Disconnected from (invalid |authenticating )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?$/\2/' | sort | uniq

# remove duplicate and count the number of lines
cat ssh.log | sed -E 's/^.*?Disconnected from (invalid |authenticating )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?$/\2/' | sort | uniq -c

# then sort numeric on the first column of the input
cat ssh.log | sed -E 's/^.*?Disconnected from (invalid |authenticating )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?$/\2/' | sort | uniq -c | sort -nk1,1
# -n: numeric
# -k: like split the white space
# 1,1: start at the first column and end at the first column

# take and join all usernames to 1 line separate by ','
cat ssh.log | sed -E 's/^.*?Disconnected from (invalid |authenticating )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?$/\2/' | sort | uniq -c | sort -nk1,1 | tail -n20 | awk '{print $2}' | paste -sd,
# awk '{print $2}': awk parse input from white space to column and let your operate on these columns separately and print the $2 column
# paste -sd,: paste is a program that take a bunch of lines and paste them together into a single line (-s) with the delimiter (-d) ','

# awk example: get all username that only appear once and start with 'c' and end with 'e'
cat ssh.log | sed -E 's/^.*?Disconnected from (invalid |authenticating )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?$/\2/' | sort | uniq -c | awk '$1 == 1 && $2 ~ /^c.*e$/ {print $0}'
# $1 == 1: appear once, column 1 == 1
# $2 ~ /^c.*e$/: column 2 match regex pattern
# {print $0}: print the whole line


