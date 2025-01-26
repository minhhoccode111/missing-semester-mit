# Git Commands

## Lesson notes

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

## Learn Git Branching

### Introduction Sequence

Lvl 1: commits

```sh
git commit
```

Lvl 2: branches

```sh
git checkout -b bugFix
```

Lvl 3: Merge

```sh
git merge bugFix
```

Lvl 4: Rebase

```sh
git rebase main
```

### Ramping Up

Lvl 5: Rampup 1

```sh
git checkout C4
```

Lvl 6: Rampup 2

```sh
git checkout main^
git checkout bugFix^
git checkout HEAD^
```

Lvl 7: Rampup 3 (redo)

```sh
git checkout main HEAD~3
git branch -f main HEAD~3
```

Lvl 8: Rampup 4

```sh
git reset HEAD^
git revert HEAD
```

### Moving Work Around

Lvl 9: Move 1

```sh
git cherry-pick C2 C4 C7
```

Lvl 10: Move 2

```sh
git rebase -i HEAD~4
# then drop, squash, fixup, etc
```

### A Mixed Bag

Lvl 11: Mixed 1 (redo)

```sh
git rebase -i HEAD~3
git checkout main
git merge bugFix
```

Lvl 12: Mixed 2 (redo)

```sh
git rebase -i HEAD~2
# then swap
git rebase -i HEAD^
git rebase -i HEAD~2
# then swap
git checkout main
git merge caption
```

Lvl 13: Mixed 3

```sh
git checkout C1
git cherry-pick C2
git checkout main
git cherry-pick C2' C3
```

Lvl 14: Mixed 4

```sh
git tag v1 C1
```

```sh
git tag v0 C1
git tag v1 C2
git checkout C2
```

Lvl 15: Mixed 5

```sh
git tag v2 main
git describe main
```

### Advanced Topics

Lvl 16: Advanced 1 (redo)

```sh
git checkout bugFix
git rebase main
git checkout side
git rebase bugFix
git checkout another
git rebase side
git checkout main
git rebase another
```

Lvl 17: Advanced 2 (redo)

```sh
git checkout main^
git checkout main^^
git checkout HEAD~^2~2
```

```sh
git checkout C2
git checkout -b bugWork
git checkout main
```

Lvl 18: Advanced 3 (used 12 commands instead of 5) (redo)

```sh
git rebase -i HEAD~4
# drop and re-order commits
git checkout one
git merge main

git checkout two
git cherry-pick C5
git checkout main
git rebase two
git checkout two
git rebase main

git checkout three
git merge C2

git branch -f main C5
```

### Push & Pull -- Git Remotes

Lvl 19: Remote 1

```sh
git clone
```

Lvl 20: Remote 2

```sh
git checkout o/main; git commit
```

```sh
git commit
git checkout o/main; git commit
```

Lvl 21: Remote 3

```sh
git fetch
```

Lvl 22: Remote 4

```sh
git fetch; git merge o/main
git pull
```

Lvl 23: Remote 5

```sh
git clone
git fakeTeamwork main 2
git commit
git pull
git merge
```

Lvl 24: Remote 6

```sh
git push
```

```sh
git commit
git commit
git push
```

Lvl 25: Remote 7

```sh
git fetch; git rebase o/main; git push
git fetch; git merge o/main; git push
git pull --rebase; git push
git pull; git push
```

```sh
git clone
git fakeTeamwork main 1
git commit
git pull --rebase
git push
```

Lvl 26: Remote 8

```sh
git reset HEAD^
git checkout -b feature C2
git push
```

### To Origin and Beyond -- Advanced Git Remotes

Lvl 27: Remote Advanced 1 (redo)

With rebase

```sh
git pull --rebase; git push
```

```sh
git checkout main
git pull
git cherry-pick C2 C3 C4 C5 C6 C7
git push
```

Lvl 28: Remote Advanced 2

With merge

```sh
git checkout main
git pull
git merge side1
git merge side2
git merge side3
git push
```

Lvl 29: Remote Advanced 3

```sh
git checkout -b totallyNotMain o/main
git branch -u o/main totallyNotMain
git branch -u o/main
```

```sh
git checkout -b side o/main
git commit
git pull --rebase
git push
```

Lvl 30: Remote Advanced 4

```sh
git checkout C0; git push origin main
```

```sh
git push origin main
git push origin foo
```

Lvl 31: Remote Advanced 5

```sh
git push origin <source>:<destination>
git push origin foo^:main
git push origin main:newBranch
```

```sh
git push origin main^:foo
git push origin foo:main
```

Lvl 32: Remote Advanced 6

```sh
git fetch origin foo
git fetch origin C2:bar
git fetch
```

```sh
git fetch origin C3:foo
git fetch origin C6:main
git checkout foo
git merge main
```

Lvl 33: Remote Advanced 7

```sh
# when we try to push "nothing" to the remote branch, we actually delete it
git push origin :side
git push origin :bugFix
git push origin :foo
# when we try to fetch "nothing" to the local branch, we actually make new branch
git fetch origin :bar
git fetch origin :baz
```

```sh
git push origin :foo
git fetch origin :bar
```

Lvl 34: Remote Advanced 8

```sh
git pull origin foo
# equivalent
git fetch origin foo; git merge o/foo

git pull origin bar:bugFix
# equivalent
git fetch origin bar:bugFix; git merge bugFix

git pull origin main

git pull origin main:foo
```

```sh
git pull origin C3:foo
git pull origin C2:side
```
