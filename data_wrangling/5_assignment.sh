#!/bin/bash

# Look for boot messages that are not shared between your past three reboots   #
# (see journalctl’s -b flag). Break this task down into multiple steps. First, #
# find a way to get just the logs from the past three boots. There may be an   #
# applicable flag on the tool you use to extract the boot logs, or you can use #
# sed '0,/STRING/d' to remove all lines previous to one that matches STRING.   #
# Next, remove any parts of the line that always varies (like the timestamp).  #
# Then, de-duplicate the input lines and keep a count of each one (uniq is your#
# friend). And finally, eliminate any line whose count is 3 (since it was      #
# shared among all the boots).                                                 #

# get 
journalctl -b -0 > 5_boot0.log # current
journalctl -b -1 > 5_boot1.log # previous
journalctl -b -2 > 5_boot2.log # two boots ago

# example a log have this timestamp
# Thg 8 28 17:32:50 mhc kernel:   Intel GenuineIntel
# remove time stamp
sed -i 's/^[^:]*:[^:]*:[^ ]* [^ ]* //' ./5_boot0.log
sed -i 's/^[^:]*:[^:]*:[^ ]* [^ ]* //' ./5_boot1.log
sed -i 's/^[^:]*:[^:]*:[^ ]* [^ ]* //' ./5_boot2.log

# combine the logs and count unique entries
cat 5_boot0.log 5_boot1.log 5_boot2.log | sort | uniq -c > 5_combined.log

# filter out logs that appear in all 3 boots
awk '$1 != 3' 5_combined.log > 5_final_output.log
rm ./5_boot* ./5_combined.log
