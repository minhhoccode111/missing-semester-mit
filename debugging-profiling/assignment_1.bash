#!/bin/bash

# use `journalctl` on linux or `log show` on macOS to get the super user
# accesses and commands in the last day. fi there aren't any you can execute
# some harmless commands such as `ls` and check again

journalctl --since "1d ago"
