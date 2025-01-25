# Notes

Only get the latest snapshot in big repo when clone

```bash
git clone --shallow git@<hosting>:<username>/<repo>.git
```

Choose which hunk in a file to add

```bash


git add -p <path>
```

Show diff in staging area

```bash
git diff --cached
```

```bash

Who, what, when made the line change
```

```bash
git blame
```

Store changes in working directory to a safe place

```bash
git stash
```

Pop the previous stash

```bash
git stash pop

```

Example you notice one of your test cases fails but you don't know in which
commit it failed so you bisect the commits to find out which one it failed in
git bisect can binary search your commit history to find out in which commit it
failed

```bash
git bisect
```
