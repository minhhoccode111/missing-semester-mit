#!/bin/bash

# assignment_5.py are some sorting algorithm implementations. Use cProfile and
# line_profiler to compare the runtime of insertion sort and quicksort. What is
# the bottleneck of each algorithm? Use then memory_profiler to check the
# memory consumption, why is insertion sort better? Check now the inplace
# version of quicksort. Challenge: Use perf to look at the cycle counts and
# cache hits and misses of each algorithm.

# sort by total time
python -m cProfile -s tottime assignment_5.py 1000

# # store the result in a file and see the result with snakeviz
# python -m cProfile -o assignment_5.prof assignment_5.py 1000
# pip install snakeviz --break-system-packages
# snakeviz assignment_5.prof
