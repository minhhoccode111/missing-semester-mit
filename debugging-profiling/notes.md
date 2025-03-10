# Notes

- `perf list` - list the events that can be traced with perf
- `perf stat COMMAND ARG1 ARG2` - gets counts of different events related to a
  process or command
- `perf record COMMAND ARG1 ARG2` - records the run of a command and saves the
  statistical data into a file called `perf.data`
- `perf report` - formats and prints the data collected in `perf.data`
