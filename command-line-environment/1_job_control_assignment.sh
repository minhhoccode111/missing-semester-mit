#!/bin/env bash

# From what we have seen, we can use some ps aux | grep commands to get our jobs’ pids and then kill them, but there are better ways to do it. 
# Start a sleep 10000 job in a terminal, background it with Ctrl-Z and continue its execution with bg.
# Now use pgrep to find its pid and pkill to kill it without ever typing the pid itself.
# (Hint: use the -af flags).

echo Hello, World!

# start a job in background
sleep 10000 &

# confirm it exist
jobs

# find it
pgrep -f sleep

# terminate it
pkill -f sleep

# list jobs again to confirm it's gone
jobs

