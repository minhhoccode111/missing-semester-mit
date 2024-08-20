#!/bin/bash

################################## WILDCARDS ###################################
# ? and *
# example: foo, foo1, foo2, foo10, bar
rm foo?
# will delete foo1, foo2
rm foo*
# will delete foo, foo1, foo2, foo10
# and NOT bar

################################# CURLY BRACES #################################
convert image.{png,jpg}
# will expand to
convert image.png image.jpg

cp /path/to/file/{foo,bar,baz}.sh /newpath
# will expand to
cp /path/to/file/foo.sh /path/to/file/bar.sh  /path/to/file/baz.sh /newpath

# globbing techniques can also be combined
mv *{.py,.sh} folder
# will move all *.py and *.sh files

mkdir foo bar
# this creates files foo/a, foo/b, ... foo/h, bar/a, bar/b, ...
touch {foo,bar}/{a..h}
touch foo/x bar/y
# show differences between files in foo and bar
diff <(ls foo) <(ls bar)
# outputs
# < x
# ---
# > y



