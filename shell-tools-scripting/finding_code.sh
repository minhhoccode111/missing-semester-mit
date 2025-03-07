#!/bin/bash

# make rg show stats by default
alias rg=rg --stats

# find all typescript files where I used the axios library
rg -t ts 'import axios from "axios"' ~/ > axios_in_typescript_result

# find all files (including hidden files) without a sheband line
rg -u --files-without-match "^#!"

# find all matches of foo and print the following 5 lines
rg foo -A 5
