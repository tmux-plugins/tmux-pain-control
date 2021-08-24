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

bind_key() {
	local dis_key
	local disabled_keys
	local key

	key="$1"

	disabled_keys=$(get_tmux_option "@disabled_keys" "")
	# comma-separated list to array
	read -r -a disabled_keys <<< "${disabled_keys//,/ }"

	for dis_key in "${disabled_keys[@]}"
	do
		if [[ "$dis_key" == "$key" ]]
		then
			# The user disabled the mapping of this key
			return
		fi
	done
	tmux bind-key "$@"
}

pane_navigation_bindings() {
	bind_key h   select-pane -L
	bind_key C-h select-pane -L
	bind_key j   select-pane -D
	bind_key C-j select-pane -D
	bind_key k   select-pane -U
	bind_key C-k select-pane -U
	bind_key l   select-pane -R
	bind_key C-l select-pane -R
}

window_move_bindings() {
	bind_key -r "<" swap-window -d -t -1
	bind_key -r ">" swap-window -d -t +1
}

pane_resizing_bindings() {
	local pane_resize=$(get_tmux_option "@pane_resize" "$default_pane_resize")
	bind_key -r H resize-pane -L "$pane_resize"
	bind_key -r J resize-pane -D "$pane_resize"
	bind_key -r K resize-pane -U "$pane_resize"
	bind_key -r L resize-pane -R "$pane_resize"
}

pane_split_bindings() {
	bind_key "|" split-window -h -c "#{pane_current_path}"
	bind_key "\\" split-window -fh -c "#{pane_current_path}"
	bind_key "-" split-window -v -c "#{pane_current_path}"
	bind_key "_" split-window -fv -c "#{pane_current_path}"
	bind_key "%" split-window -h -c "#{pane_current_path}"
	bind_key '"' split-window -v -c "#{pane_current_path}"
}

improve_new_window_binding() {
	bind_key "c" new-window -c "#{pane_current_path}"
}

main() {
	pane_navigation_bindings
	window_move_bindings
	pane_resizing_bindings
	pane_split_bindings
	improve_new_window_binding
}
main
