#!/bin/bash

# Limiting a process's resources can be another handy tool in your toolbox. Try
# running `stress -c 3` and visualize the CPU consumption with `htop`. Now,
# execute `taskset --cpu-list 0,2 stress -c 3` and visualize it. Is `stress`
# taking three CPUs? Why not? Read
# [`man taskset`](https://www.man7.org/linux/man-pages/man1/taskset.1.html).
# Challenge: achieve the same using
# [`cgroups`](https://www.man7.org/linux/man-pages/man7/cgroups.7.html). Try
# limiting the memory consumption of `stress -m`.

# --- SOLUTION AI GENERATED ---

# ## First test with `stress`
# When you run `stress -c 3`, the program creates 3 worker threads that consume CPU. Each worker will try to use 100% of a CPU core. If you visualize this with `htop`, you'd see 3 cores at or near 100% utilization.
#
# ## Second test with `taskset`
# When you run `taskset --cpu-list 0,2 stress -c 3`, you're restricting the `stress` process to only use CPU cores 0 and 2 (CPUs are zero-indexed in Linux).
#
# In this case, even though `stress` tries to create 3 CPU-intensive workers, it can only use 2 CPU cores because that's what you've limited it to with `taskset`. So when viewing with `htop`, you'd see only cores 0 and 2 being utilized, not 3 CPUs.
#
# This is because `taskset` applies CPU affinity, which restricts which CPU cores a process can run on. The `--cpu-list 0,2` option specifically tells the kernel to only allow this process to run on cores 0 and 2.
#
# ## Challenge with `cgroups`
# For the challenge using `cgroups` (control groups), you need to:
#
# 1. Create a cgroup
# 2. Set CPU limits
# 3. Add your process to the cgroup
#
# Here's how you could limit CPU usage with cgroups (v2):
#
# ```bash
# # Create a directory for the cgroup
# sudo mkdir -p /sys/fs/cgroup/cpu_limit
#
# # Limit the CPU usage to cores 0 and 2
# sudo echo "0-2" > /sys/fs/cgroup/cpu_limit/cpuset.cpus
#
# # Add the current shell to the cgroup
# echo $$ > /sys/fs/cgroup/cpu_limit/cgroup.procs
#
# # Run stress
# stress -c 3
# ```
#
# For limiting memory with `stress -m`:
#
# ```bash
# # Create a cgroup for memory limiting
# sudo mkdir -p /sys/fs/cgroup/memory_limit
#
# # Set memory limit (e.g., 100MB)
# sudo echo "100M" > /sys/fs/cgroup/memory_limit/memory.max
#
# # Add current shell to the cgroup
# echo $$ > /sys/fs/cgroup/memory_limit/cgroup.procs
#
# # Run stress with memory workers
# stress -m 2
# ```
#
# Note that exact commands might differ slightly depending on your Linux distribution and whether you're using cgroups v1 or v2. The above examples are for cgroups v2. On systems with cgroups v1, the paths would be different (typically under `/sys/fs/cgroup/cpu` and `/sys/fs/cgroup/memory`).
