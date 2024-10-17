#!/bin/env bash

# Say you don’t want to start a process until another completes. 
# How would you go about it? In this exercise, our limiting process will always be sleep 60 &.
# One way to achieve this is to use the wait command.
# Try launching the sleep command and having an ls wait until the background process finishes.

# However, this strategy will fail if we start in a different bash session, since wait only works for child processes. 
# One feature we did not discuss in the notes is that the kill command’s exit status will be zero on success and nonzero otherwise.
# kill -0 does not send a signal but will give a nonzero exit status if the process does not exist.
# Write a bash function called pidwait that takes a pid and waits until the given process completes.
# You should use sleep to avoid wasting CPU unnecessarily.

echo Hello, World!

pidwait() {
  pid=$1
  while kill -0 "$pid" 2>/dev/null; do
    sleep 1  # Sleep for 1 second to avoid using too much CPU
  done
}

# use case
# sleep 30 &
# pidwait $!
# echo "Process has finished"
