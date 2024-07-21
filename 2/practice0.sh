#!/bin/bash

# declare a variable
foo=bar

echo
# print variable foo
echo $foo

echo
# print the variable foo, work like `${variable}` in javascript
echo "$foo"

echo
# literally print the string "$foo"
echo '$foo'

# $0 - name of the script
# $1 to $9 - arguments to the script. $1 is the first and so on
# $@ - all the arguments
# $# - number of arguments
# $? - return code of the previous command
# $$ - process identification number (PID) for the current script
# !! - entire last command, including arguments, a common pattern is to execute
# a command only for it to fail due to missing permissions; you can quickly
# re-execute the command with sudo by doing `sudo !!`
# $_ - last argument from the last command, if you are in an interactive shell
# you can also quickly get this value by typing `Esc` followed by `.` or
# `Alt + .`

echo
false || echo "Oops, fail"
# Oops, fail


echo
true || echo "Will not be printed"
#


echo
true && "Things went well"
# Things went well

echo
false && echo "Will not be printed"
#

echo
true ; echo "This will always run"
# This will always run

echo
false ; echo "This will always run"
# This will always run

############################ COMMAND SUBSTITUTION ##############################
# $(CMD)
echo
echo "$(ls)" # executet ls and substitute its output in place
# for file in $(ls)


########################### PROCESS SUBSTITUTION ###############################
# <(CMD)
echo
echo <(ls) 
# execute ls and place the output in a temp file and substitute the `<()` with 
# that file's name `<()` with that file's name
# this is useful when commands expect values to be passed by file instead of by
# STDIN

# example: will show the differences between files in dirs `foor` and `bar`
diff <(ls foo) <(ls bar)

# willcards example
# files: foo, foo1, foo2, foo10, bar
# rm foo? ---> will remove foo1 and foo2
# rm foo* ---> will remove foo0, foo1, foo2, foo10


################################################################################

