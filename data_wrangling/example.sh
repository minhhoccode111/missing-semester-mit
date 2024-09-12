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
