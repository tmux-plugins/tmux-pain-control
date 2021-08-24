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

window_move_bindings() {
	tmux bind-key -r "<" swap-window -d -t -1
	tmux bind-key -r ">" swap-window -d -t +1
}

pane_resizing_bindings() {
	local pane_resize=$(get_tmux_option "@pane_resize" "$default_pane_resize")
	tmux bind-key -r H resize-pane -L "$pane_resize"
	tmux bind-key -r J resize-pane -D "$pane_resize"
	tmux bind-key -r K resize-pane -U "$pane_resize"
	tmux bind-key -r L resize-pane -R "$pane_resize"
}

pane_split_bindings() {
	tmux bind-key "|" split-window -h -c "#{pane_current_path}"
	tmux bind-key "\\" split-window -fh -c "#{pane_current_path}"
	tmux bind-key "-" split-window -v -c "#{pane_current_path}"
	tmux bind-key "_" split-window -fv -c "#{pane_current_path}"
	tmux bind-key "%" split-window -h -c "#{pane_current_path}"
	tmux bind-key '"' split-window -v -c "#{pane_current_path}"
}

improve_new_window_binding() {
	tmux bind-key "c" new-window -c "#{pane_current_path}"
	tmux bind-key "e" new-window -ac "#{pane_current_path}" # new-window (hEre)
}

main() {
	pane_navigation_bindings
	window_move_bindings
	pane_resizing_bindings
	pane_split_bindings
	improve_new_window_binding
}
main
