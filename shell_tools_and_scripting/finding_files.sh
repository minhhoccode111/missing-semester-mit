#!/bin/bash

# find all directories named src
find . -name src -type d

# find all python files that have a folder named test in their path
find . -path '*/test/*.py' -type f

# find all files modified in the last day
find . -mtime -1

# find all zip files with the size in range 500k to 10M
find . -size  +500k -size -10M -name '*.tar.gz'

# delete all files with .tmp extension
find . -name '*.tmp' -exec rm {} \;

# find all PNG files and convert them to JPG
find . -name '*.png' -exec convert {} {}.jpg \;

