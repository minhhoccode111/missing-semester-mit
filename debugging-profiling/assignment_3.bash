#!/bin/bash

# install `shellcheck` and try checking the following script. what is wrong
# with the code? fix it, install a linter plugin in your editor so you can get
# your warnings automatically

## Example: a typical script with several problems
for f in $(ls *.m3u); do
    grep -qi hq.*mp3 $f &&
        echo -e 'Playlist $f contains a HQ file in mp3 format'
done

# Diagnostics:
# 1. Iterating over ls output is fragile. Use globs. [SC2045]
# 2. Use ./*glob* or -- *glob* so names with dashes won't become options. [SC2035]
# Diagnostics:
# 1. Quote the grep pattern so the shell won't interpret it. [SC2062]
# 2. Double quote to prevent globbing and word splitting. [SC2086]
# Diagnostics:
# 1. Expressions don't expand in single quotes, use double quotes for that. [SC2016]
