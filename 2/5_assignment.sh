#!/bin/env bash

echo Find the most recetly modified file:
find ./ -type f -printf '%T+ %p\n' | sort -r | head -n 1

# new lines
echo

echo List all files by recency:
find ./ -type f -printf '%T+ %p\n' | sort -r

# write the last output to a file
# !! > 5_output

