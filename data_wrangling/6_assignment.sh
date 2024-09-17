#!/bin/env bash

################################ REQUIREMENTS ##################################
# Find an online data set like
# https://stats.wikimedia.org/EN/TablesWikipediaZZ.htm
# https://ucr.fbi.gov/crime-in-the-u.s/2016/crime-in-the-u.s.-2016/topic-pages/tables/table-1
# or maybe one from here
# https://www.springboard.com/blog/data-science/free-public-data-sets-data-science-project/
# Fetch it using curl and extract out just two columns of numerical data. If
# you’re fetching HTML data, pup might be helpful. For JSON data, try jq. Find
# the min and max of one column in a single command, and the difference of the
# sum of each column in another.

# Fetch the HTML data and extract the Date and New post columns
curl -s "https://stats.wikimedia.org/EN/TablesWikipediaZZ.htm" \
| pup 'table#table1 tr td.rb:nth-child(1), table#table1 tr td.rb:nth-child(3)' \
| pup 'text{}' \
| awk '
BEGIN {
    print "Date\t\tNew Posts"
    print "--------------------"
}
{
    if (NR % 2 == 1) {
        date = $0
    } else {
        gsub(/,/, "", $0)  # Remove commas from numbers
        printf "%s\t%s\n", date, $0
    }
}'
# | tail -n 20  # Display only the last 20 entries

# Calculate and display statistics
echo -e "\nStatistics:"
curl -s "https://stats.wikimedia.org/EN/TablesWikipediaZZ.htm" | \
pup 'table#table1 tr td.rb:nth-child(3)' |\
awk '
{
    gsub(/,/, "", $0)  # Remove commas from numbers
    if (NR == 1) {
        min = max = sum = $0
    } else {
        if ($0 < min) min = $0
        if ($0 > max) max = $0
        sum += $0
    }
    count++
}
END {
    printf "Minimum new posts: %d\n", min
    printf "Maximum new posts: %d\n", max
    printf "Average new posts: %.2f\n", sum/count
    printf "Total new posts: %d\n", sum
}'

# output
# Statistics:
# Minimum new posts: 7
# Maximum new posts: 0 # TODO: fix this bug
# Average new posts: 4115.21
# Total new posts: 2666656
