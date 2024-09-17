#!/bin/env bash

################################ REQUIREMENTS ##################################
# Look for boot messages that are not shared between your past three reboots
# (see journalctl’s -b flag). Break this task down into multiple steps. First,
# find a way to get just the logs from the past three boots. There may be an
# applicable flag on the tool you use to extract the boot logs, or you can use
# sed '0,/STRING/d' to remove all lines previous to one that matches STRING.
# Next, remove any parts of the line that always varies (like the timestamp).
# Then, de-duplicate the input lines and keep a count of each one (uniq is your
# friend). And finally, eliminate any line whose count is 3 (since it was shared
# among all the boots).

# sample output
# Thg 9 16 08:32:42.466211 mhc ...

journalctl -b -2 -o short-precise \
| sed 's/[^ ]* [^ ]* [^ ]* [^ ]* [^ ]*//' \
| sed 's/time=".*"//' \
| sed 's/20..-..-..//' \
| sed 's/..:..:.. //' \
| sed 's/GNOME Shell started at .*//' \
| sort \
| uniq -c \
| awk '$1 % 3 != 0 {print $0}' \
| sort -nk1,1




