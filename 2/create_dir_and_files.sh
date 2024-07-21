#!/bin/bash

# Date will be substituted and printed
echo "Starting program at $(date)"

# $0: program's name 
# $#: number of arguments
# $$: process identification number (PID) for the current script
echo "Running program $0 with $# arguments with pid $$"


# $@: all the arguments
# loop through every arguments
# $?: return code of the previous command
for file in "$@"; do
    # >: is used to redirect standard output (stdout) to a file or device
    # 2>: is used to redirect standard error (stderr) to a file or device
    # /dev/null is a special file that discards any input written to it
    grep foobar "$file" > /dev/null 2> /dev/null
    # when pattern is not found, grep has exit status 1
    # we redirect STDOUT and STDERR to a null register since we do not care
    # about them

    # check if the return code of `grep foobar "$file" > /dev/null 2> /dev/null`
    # is not equal (-ne) to 0
    # more on -ne: https://www.man7.org/linux/man-pages/man1/test.1.html
    # when perform comparison in bash, use [[]] over [] because chances of
    # making mistakes are lower although it won't be portable to `sh`
    # more on [[]] vs [] here: https://mywiki.wooledge.org/BashFAQ/031
    if [[ $? -ne 0 ]]; then
        echo "File $file does not have any foobar, adding one"
        fi
        echo "# foobar" >> "$file"
done
