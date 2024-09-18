### What is Tmux?
`tmux` (Terminal Multiplexer) is a tool that allows you to manage multiple terminal sessions from a single window. It's particularly useful for managing long-running processes and organizing your terminal environment, especially when working on remote servers.

### Why Use Tmux?
- Session Management: You can start a session, detach from it, and reattach later, preserving the state of your work.
- Multiple Panes: Split your terminal window into multiple panes, running different commands or programs simultaneously.
- Persistent Sessions: Keep processes running even if you disconnect from the session.
- Easier Workflow: Switch between multiple terminal windows and panes without cluttering your screen.

### Basic Tmux Workflow

#### 1. Installation
Most Linux distributions come with `tmux` pre-installed. If not, you can install it using:
```bash
sudo apt update
sudo apt install tmux
```

#### 2. Starting Tmux
To start a new tmux session:
```bash
tmux
```
This opens a new session and starts a shell in that session. At the bottom of the screen, you'll see a status bar showing information about your tmux session.

#### 3. Tmux Prefix
`tmux` commands are usually preceded by a prefix key combination, defaulting to `Ctrl+B`. This means that to issue any command, you first press `Ctrl+B`, then the command key.

#### 4. Basic Commands
Here are some essential commands to get you started:
- Detach from a session: `Ctrl+B`, then `D`
  - Detaches from the current tmux session, leaving it running in the background.
- List sessions: `tmux ls`
  - Lists all current tmux sessions.
- Reattach to a session: `tmux attach -t <session-name>`
  - Reattaches to a specified tmux session.

### Working with Windows and Panes

#### 1. Windows in Tmux
Tmux windows are like tabs in a web browser. You can create multiple windows within a single session.
- Create a new window: `Ctrl+B`, then `C`
  - Opens a new window with a shell.
- Switch between windows: `Ctrl+B`, then `N` (Next) or `P` (Previous)
  - Navigate between windows.
- Select window by number: `Ctrl+B`, then the window number (`0`, `1`, `2`, ...)
  - Directly jump to a specific window.
- Rename a window: `Ctrl+B`, then `,`
  - Rename the current window for easier identification.

#### 2. Panes in Tmux
Panes allow you to split a window into multiple sections.
- Split horizontally: `Ctrl+B`, then `"` 
  - Splits the current pane into two, one above the other.
- Split vertically: `Ctrl+B`, then `%`
  - Splits the current pane into two, side by side.
- Navigate between panes: `Ctrl+B`, then arrow keys
  - Move between panes using the arrow keys.
- Resize panes: `Ctrl+B`, then `:` and use `resize-pane` command
  - Example: `resize-pane -D 10` resizes the pane downward by 10 cells.
- Close a pane: `Ctrl+D` or type `exit`
  - Closes the current pane.

### Advanced Tmux Features

#### 1. Sessions Management
Tmux sessions allow you to organize different tasks or projects.
- Create a named session: `tmux new -s <session-name>`
  - Start a new session with a specific name.
- Detach from a session: `Ctrl+B`, then `D`
- List sessions: `tmux ls`
- Attach to a session: `tmux attach -t <session-name>`
- Kill a session: `tmux kill-session -t <session-name>`
  - Ends a session.

#### 2. Scripting Tmux
Tmux commands can be scripted for automation.
- Send commands to a session: `tmux send-keys -t <session-name>:<window> '<command>' C-m`
  - Example: `tmux send-keys -t mysession:1 'ls -l' C-m`

#### 3. Tmux Copy Mode
Tmux allows you to copy and paste text.
- Enter copy mode: `Ctrl+B`, then `[`
  - Use arrow keys to navigate.
- Start selection: `Space`
  - Move to select text.
- Copy selection: `Enter`
  - Copies the selected text to the tmux buffer.
- Paste text: `Ctrl+B`, then `]`
  - Pastes the copied text into the current pane.

#### 4. Customizing Tmux
Tmux is highly customizable via the `.tmux.conf` file in your home directory.
- Change prefix key:
  ```bash
  set-option -g prefix C-a
  unbind C-b
  bind C-a send-prefix
  ```
  This changes the prefix from `Ctrl+B` to `Ctrl+A`.
- Set window index base:
  ```bash
  set -g base-index 1
  ```
  Makes window numbering start from 1 instead of 0.
- Enable mouse support:
  ```bash
  set -g mouse on
  ```
  Allows using the mouse to switch between windows and panes.

#### 5. Sync Panes
You can send the same command to multiple panes simultaneously.
- Toggle pane synchronization: `Ctrl+B`, then `:`
  - Enter `setw synchronize-panes`
  - This lets you type a command in one pane and have it replicated across all panes in the window.

### Tips and Tricks

#### 1. Tmux Resurrect and Continuum
These plugins can save and restore your tmux sessions.
- Tmux Resurrect: Saves the state of tmux (sessions, windows, panes) so you can restore it later.
- Tmux Continuum: Automatically saves and restores tmux sessions.
  
To install, you need to use a plugin manager like `tpm` (Tmux Plugin Manager).

#### 2. Zooming into Panes
If you want to focus on one pane, you can zoom it to fill the window.
- Zoom/Unzoom: `Ctrl+B`, then `Z`

#### 3. Copying and Pasting with the System Clipboard
To copy text from tmux into the system clipboard:
- Install `xclip` (on Linux) or `pbcopy` (on macOS).
- Add the following to your `.tmux.conf`:
  ```bash
  bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -in"
  ```

### Example Workflow
1. Start a new session: `tmux new -s dev`
2. Create multiple windows:
   - `Ctrl+B`, then `C` (New window for editing code)
   - `Ctrl+B`, then `C` (New window for running server)
3. Split windows into panes:
   - `Ctrl+B`, then `%` (Run server in one pane)
   - `Ctrl+B`, then `"` (Monitor logs in another pane)
4. Detach from the session: `Ctrl+B`, then `D`
5. Reattach later: `tmux attach -t dev`

By using `tmux` effectively, you can significantly enhance your productivity in the terminal, especially for managing multiple tasks and remote work.
