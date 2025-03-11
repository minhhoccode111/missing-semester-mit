#!/bin/bash

# assignment_5.py are some sorting algorithm implementations. Use cProfile and
# line_profiler to compare the runtime of insertion sort and quicksort. What is
# the bottleneck of each algorithm? Use then memory_profiler to check the
# memory consumption, why is insertion sort better? Check now the inplace
# version of quicksort. Challenge: Use perf to look at the cycle counts and
# cache hits and misses of each algorithm.

# installl line_profiler
# pip install line_profiler --break-system-packages

kernprof -l -v assignment_5.py 1000
# need to place @profile before each function
