#!/usr/bin/env python3
# this is base on where the python interpreter place in your system

# note that the above line is depended on your local machine
# we can check by using `which python`

import sys

for arg in reversed(sys.argv[1:]):
    print(arg)
