#! /bin/bash

# go to the /sys dir
cd /sys

# "fd" is used to search files like "find" program
# but written in Rust and use regex
# find every file with "temp" in name
sudo fd temp

# print to the terminal, I don't know if this is the right one
cat ./devices/virtual/thermal/thermal_zone0/temp
# 27800
