#!/bin/zsh

# This script starts vim with a separate tmux pane.
# Inputs:
#   *arg1: name of text file


TMUX_CONF="$HOME/.tmux_vim.conf"
SESSION_NAME="code"

# set the variable to "none" if no argument is provided
arg="${1:-none}"

# start detached tmux session
tmux -f "$TMUX_CONF" new-session -d -s "$SESSION_NAME"

# open vim
if [[ "$arg" == "none" ]]; then
    tmux send-keys "vim" C-m
else
    tmux send-keys "vim $arg" C-m
fi

# split horizontally
tmux split-window -v 
tmux resize-pane -D 10

# select vim pane
# note that first pane is set to 1 in .tmux.conf
tmux select-pane -t 1 

# Attach to the session
tmux attach-session -t "$SESSION_NAME"
