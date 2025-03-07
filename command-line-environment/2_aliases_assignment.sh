#!/bin/env bash

# run `history | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 10` to get your top 10 most used commands and consider writing shorter aliases for them
# note: this works for bash; if you're using zsh, use `history 1` instead of just `history`

history | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 20

    #  22 l # ls -Ghal --color=auto
    #  23 git push origin main
    #  25 git status
    #  25 jobs
    #  28 off # poweroff
    #  29 1 # cd .. # back 1 level folder
    #  30 asd # sudo nala update && sudo nala upgrade && flatpak update && bun upgrade --stable
    #  35 git add .
    #  40 git pull origin main
    #  42 tmux
    #  47 cdv # cd ~/.config/nvim/
    #  50 cdp # cd ~/project/
    #  71 cdl # cd ~/learn/
    #  74 log # git log --graph --oneline --all
    #  88 cdf # cd ~/dotfiles/
    # 122 cd
    # 135 gs # git status
    # 164 nv # nvim
    # 307 ls
    # 971 c # clear

# so i already alias most of the command

# get current git branch of current working directory
get_git_branch() {
  git branch 2>/dev/null | grep "^*" | colrm 1 2
}

# some improvement base on that output
alias ga="git add ."
alias gs="git status"
alias gp='git push origin $(get_git_branch)'
alias gpl='git pull origin $(get_git_branch)'
alias t="tmux"
