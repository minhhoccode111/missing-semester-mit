#!/usr/bin/env bash

# Say you have a command that fails rarely. In order to debug it you need to capture its output but it can be time consuming to get a failure run. Write a bash script that runs the following script until it fails and captures its standard output and error streams to files and prints everything at the end. Bonus points if you can also report how many runs it took for the script to fail.
#
# the script below rarely fails, will be store in a fail_script file
#
#  #!/usr/bin/env bash
#
#  n=$(( RANDOM % 100 ))
#
#  if [[ n -eq 42 ]]; then
#     echo "Something went wrong"
#     >&2 echo "The error was using magic numbers"
#     exit 1
#  fi
#
#  echo "Everything went according to plan"

# clear the file
> 3_output.log
# init var
exit_code=0
count_call=0
# loop til the exit_code != 0 (1 when the script fail_script fails)
for (( ; exit_code == 0; ))
do
    # `> output.log` redirects `stdout` to `output.log`
    # `2>&1` redirects `stderr` to `stdout`, so both `stdout` and `stderr` go to `output.log`
    ./fail_script.sh >> 3_output.log 2>&1
    # $?: the exit code of the last command
    exit_code=$?
    # increase count_call
    ((count_call=count_call+1))
    # add output to the file
done

# add count_call to the file to be printed
echo "Script fails after $count_call calls" >> 3_output.log

# print the file
cat 3_output.log
