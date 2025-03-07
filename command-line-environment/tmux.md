# Sessions

A session is an independent workspace with one or more windows

- `tmux` start a new session
- `tmux new -s NAME` starts it with that name
- `tmux ls` lists the current sessions
- Within `tmux` typing `<C-b> d` detaches the current session
- `tmux a` attaches the last session. You can use `-t` flag to specify which
- `tmux kill-session -t NAME` to kill a session with that `NAME`
- `tmux rename-session -t 0 NAME` to rename a `0` session to that `NAME`

# Windows

Equivalent to tabs in editors or browsers, they are visually separate parts of the same session

- `<C-b> c` creates a new window. Close it by terminate the shells `<C-d>`
- `<C-b> N` go to the *N*th window
- `<C-b> p` go to previous window
- `<C-b> n` go to next window
- `<C-b> ,` rename the current window
- `<C-b> w` list current windows

# Panes

Like vim splits, panels let you have multiple shells in the same visual display

- `<C-b> "` split the current pane horizontally
- `<C-b> %` split the current pane vertically
- `<C-b> <direction>` move the pane in the specified direction (arrow keys)
- `<C-b> z` toggle zoom for the current pane
- `<C-b> [` start scrollback. You can then press `<space>` to start a selection and `<enter>` to copy that selection
- `<C-b> <space>` cycle through pane arrangements
