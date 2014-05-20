#!/usr/bin/env bash

default_pane_resize="5"

# tmux show-option "q" (quiet) flag does not set return value to 1, even though
# the option does not exist. This function patches that.
get_tmux_option() {
    local option=$1
    local default_value=$2
    local option_value=$(tmux show-option -gqv "$option")
    if [ -z $option_value ]; then
        echo $default_value
    else
        echo $option_value
    fi
}

pane_navigation_bindings() {
    tmux bind-key h   select-pane -L
    tmux bind-key C-h select-pane -L
    tmux bind-key j   select-pane -D
    tmux bind-key C-j select-pane -D
    tmux bind-key k   select-pane -U
    tmux bind-key C-k select-pane -U
    tmux bind-key l   select-pane -R
    tmux bind-key C-l select-pane -R
}

pane_resizing_bindings() {
    local pane_resize=$(get_tmux_option "@pane_resize" "$default_pane_resize")
    tmux bind-key H resize-pane -L "$pane_resize"
    tmux bind-key J resize-pane -D "$pane_resize"
    tmux bind-key K resize-pane -U "$pane_resize"
    tmux bind-key L resize-pane -R "$pane_resize"
}

pane_split_bindings() {
    tmux bind-key "|" split-window -h
    tmux bind-key "-" split-window -v
}

main() {
    pane_navigation_bindings
    pane_resizing_bindings
    pane_split_bindings
}
main
