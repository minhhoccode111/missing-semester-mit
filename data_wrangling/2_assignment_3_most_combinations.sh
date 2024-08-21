#!/bin/env bash

# Find the number of words (in /usr/share/dict/words) that contain at least three as and don’t have a 's ending. What are the three most common last two letters of those words? sed’s y command, or the tr program, may help you with case insensitivity. How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

# 3 most combinations
echo | cat /usr/share/dict/words | rg a.*a.*a.*[^\'s]$ | sed 's/.*\(..\)$/\1/' | sort | uniq -c | sort -rn | head -3
