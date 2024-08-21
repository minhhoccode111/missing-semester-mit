#!/bin/env bash

# Find your average, median, and max system boot time over the last ten boots. Use journalctl on Linux and log show on macOS, and look for log timestamps near the beginning and end of each boot.

# extract the start up time in ms
journalctl | rg Startup.*...ms | sed 's/.*\(...\)ms.*/\1/' > 4_times

# Read the times into an array
times=($(<4_times))

# Calculate the average
total=0
for time in "${times[@]}"; do
    total=$((total + time))
done
average=$((total / ${#times[@]}))

# Sort the times to find the median and max
sorted_times=($(printf '%s\n' "${times[@]}" | sort -n))
length=${#sorted_times[@]}
max=${sorted_times[-1]}

# Calculate the median
if (( length % 2 == 0 )); then
    mid=$((length / 2))
    median=$(((sorted_times[mid-1] + sorted_times[mid]) / 2))
else
    median=${sorted_times[length / 2]}
fi

echo "Average: $average ms"
echo "Median: $median ms"
echo "Max: $max ms"
