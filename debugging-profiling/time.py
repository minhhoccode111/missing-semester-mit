import time, random

n = random.randint(1, 10) * 100

# get current time
start = time.time()

# do some work
print("sleeping for {} ms".format(n))
time.sleep(n / 1000)

# conpute time between start and now
print(time.time() - start)

# output
# sleeping for 600 ms
# 0.6001825332641602
