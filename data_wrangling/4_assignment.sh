#!/bin/env bash

################################ REQUIREMENTS ##################################
# Find your average, median, and max system boot time over the last ten boots.
# Use journalctl on Linux and log show on macOS and look for log timestamps near
# the beginning and end of each boot. On Linux, they may look something like:
#
# Logs begin at ...
#
# and
#
# systemd[577]: Startup finished in ...
#
# On macOS, look for:
#
# === system boot:
#
# and
#
# Previous shutdown cause: 5

# sample one boot log
# Thg 9 14 08:26:37 mhc systemd[1]: Startup finished in 2.877s (firmware) + 2.691s (loader) + 2.086s (kernel) + 24.980s (userspace) = 32.636s.

journalctl | rg -i "systemd\[1\]: Startup finished in" | sed -E 's/.*= (.*)s\.$/\1/' | tail -n10 | R --slave -e 'x <- scan(file="stdin", quiet=TRUE); summary(x)'
# sed -E 's/.*= (.*)s\.$/\1/': remove everything but keep the between "= " and "s."
# use R to make statistic
