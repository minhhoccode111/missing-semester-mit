#!/bin/bash

# Here’s some (arguably convoluted) Python code for computing Fibonacci numbers
# using a function for each number `assignment_6.bash`.

# Put the code into a file and make it executable. Install prerequisites:
# pycallgraph and graphviz. (If you can run dot, you already have GraphViz.)
# Run the code as is with pycallgraph graphviz -- ./fib.py and check the
# pycallgraph.png file. How many times is fib0 called?. We can do better than
# that by memoizing the functions. Uncomment the commented lines and regenerate
# the images. How many times are we calling each fibN function now?

# pip install python-call-graph --break-system-packages
# sudo pacman -S graphviz
# sudo nala install -y graphviz

pycallgraph graphviz -- ./assignment_6.nocache.py
mv pycallgraph.png pycallgraph_nocache.png
o pycallgraph_nocache.png

pycallgraph graphviz -- ./assignment_6.cache.py
mv pycallgraph.png pycallgraph_cache.png
o pycallgraph_cache.png
