#!/bin/env bash

sleep 20
# but it's too long for us to wait 20 seconds, so we press Ctrl + C to cancel ^C

# ^C
# ^\
# ^Z

nohup sleep 20 &
# [2] 12312: id of the process
# appending output to nohup.out: 
jobs # list all jobs running

bg %1 # start running the program number [1] in the background

kill -STOP %1 # suspend process [1] again

kill -HUP %1 # hung up the job [1] (terminate)


