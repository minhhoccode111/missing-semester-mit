#! /bin/bash
# use bash interpreted

# current date
date

# print
echo hello world
echo "hello world"
echo hello\ world

# environment variable
echo $PATH

# where the echo program come from
which echo
# /usr/bin/echo

/usr/bin/echo $PATH

# print work dir
pwd

# list current dir
ls -al
# 3 groups: owner of the file - owning group - everyone else
# of 3 characters rwx
# r - read
# w - write
# x - execute

which mv
which cp
which mkdir

# in shell, programs have 2 primary streams associated with them
# input stream and output stream
# normally, a program's input and output stream are both your terminal
# that is, your keyboard as input and your screen as output
# however we can also rewire those streams with `< file` (input from file)
# and `> file` (output to file)

# write to a file
echo hello, world! >hello.txt

# read a file with cat
cat hello.txt

# also read a file with cat
cat <hello.txt

# read from a file and write to another file
cat <hello.txt >hello2.txt
cat <hello2.txt

# tail print n lines of the input
ls -l / | tail -n5

curl --head --silent google.com | grep --ignore-case context-length | cut --delimiter=' ' -f2

# find the brightness file
# sudo find -L /sys/class/backlight -maxdepth 2 -name '*brightness*'

# go to the dir contain that file
# cd /sys/class/backlight/thinkpad_screen

# write 3 to that file
# echo 3 > sudo tee brightness

# echo 1 | sudo tee /sys/class/leds/input6::scrolllock/brightness
