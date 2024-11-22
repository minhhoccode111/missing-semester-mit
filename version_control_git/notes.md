# Notes

```bash
# only get the latest snapshot in big repo when clone
git clone --shallow git@<hosting>:<username>/<repo>.git

# choose which hunk in a file to add
git add -p <path>

# show diff in staging area
git diff --cached

# who, what, when made the line change
git blame

# store changes in working directory to a safe place
git stash
# pop the previous stash
git stash pop

# example you notice one of your test cases fails but you don't know in which commit it failed
# so you bisect the commits to find out which one it failed in
# git bisect can binary search your commit history to find out in which commit it failed
git bisect
```
