@profile
def my_func():
    a = [1] * (10**6)
    b = [2] * (2 * 10**7)
    del b
    return a


if __name__ == "__main__":
    my_func()

# install the memory profiler package from pip
# pip install memory-profiler

# then run this command
# python -m memory_profiler memory.py

# Output:

# Filename: memory.py
#
# Line #    Mem usage    Increment  Occurrences   Line Contents
# =============================================================
#      1   24.492 MiB   24.492 MiB           1   @profile
#      2                                         def my_func():
#      3   32.137 MiB    7.645 MiB           1       a = [1] * (10**6)
#      4  184.734 MiB  152.598 MiB           1       b = [2] * (2 * 10**7)
#      5   32.211 MiB -152.523 MiB           1       del b
#      6   32.211 MiB    0.000 MiB           1       return a
