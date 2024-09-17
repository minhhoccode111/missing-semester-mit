#!/bin/bash

################################ REQUIREMENTS ##################################
# Find the number of words (in /usr/share/dict/words) that contain at least
# three as and don’t have a 's ending. What are the three most common last two
# letters of those words? sed’s y command, or the tr program, may help you with
# case insensitivity. How many of those two-letter combinations are there? And
# for a challenge: which combinations do not occur?

# NOTE:
# rg: like grep but use Rust btw

# 3 most common last two letters of those words
echo 3 most common last two letters:
cat /usr/share/dict/words | rg -i a.*a.*a[^\'s]$ | awk '{print substr($0, length($0) - 1)}' | sort | uniq -c | sort -nk1,1 | tail -n3
# print dictionary
# contain 3 "a"s and not end with "'s"
# print the last 2 characters
# unique line and count the prefix occurences
# sort by the occurences. numeric(n), split by white space and start at first column and end at first column(k1,1)

echo ""

# how many of those two-letter combinations are there
total_combinations=$(cat /usr/share/dict/words | rg -i a.*a.*a[^\'s]$ | awk '{print substr($0, length($0) - 1)}' | sort | uniq -c | sort -nk1,1 | wc -l) # 14
echo "Total combinations found: $total_combinations"


echo ""

# which combinations do not occur

# Generate all possible two-letter combinations
all_combinations=$(echo {a..z}{a..z})

# find the two-letter combinations that occur in the filtered word
occurring_combinations=$(cat /usr/share/dict/words | rg -i a.*a.*a[^\'s]$ | awk '{print substr($0, length($0) - 1)}' | sort | uniq | sort -nk1,1) # 14

# loop through all possible combinations in the filtered words
echo "Combinations that do not occur:"
for c in $all_combinations; do
    if ! echo "$occurring_combinations" | grep -qw "$c"; then
        echo "$c"
    fi
done
