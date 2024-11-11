#!/bin/zsh
# Start vim with tmux in split pane

TMUX_CONF=".tmux_vim.conf"
SESSION_NAME="code"

# start detached tmux session
tmux -f "$TMUX_CONF" new-session -d -s "$SESSION_NAME"

# open vim
tmux send-keys 'vim' C-m

# split horizontally
tmux split-window -v 
tmux resize-pane -D 10

# select vim pane
# note that first pane is set to 1 in .tmux.conf
tmux select-pane -t 1 

# Attach to the session
tmux attach-session -t "$SESSION_NAME"
