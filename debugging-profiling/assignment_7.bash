#!/bin/bash

# A common issue is that a port you want to listen on is already taken by
# another process. Let’s learn how to discover that process pid. First execute
# `python -m http.server 4444` to start a minimal web server listening on port
# 4444. On a separate terminal run lsof | grep LISTEN to print all listening
# processes and ports. Find that process pid and terminate it by running kill
# <PID>.

# run the server
# python -m http.server 4444

# terminate the server
# kill "$(lsof -t -i:4444)"

# or this
lsof | rg LISTEN | rg python | awk '{print $2}' | xargs kill
