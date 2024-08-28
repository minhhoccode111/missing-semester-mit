#!/bin/env bash

# Find an online data set like this one, this one, or maybe one from here. Fetch
# it using curl and extract out just two columns of numerical data. If you’re
# fetching HTML data, pup might be helpful. For JSON data, try jq. Find the min
# and max of one column in a single command, and the difference of the sum of
# each column in another.

# I choose this
# https://stats.wikimedia.org/EN/TablesWikipediaZZ.htm

# Fetch the HTML page and store it in a temporary file
curl --silent https://stats.wikimedia.org/EN/TablesWikipediaZZ.htm > 6_tmp.html
