# Changelog

### master
- update readme - write all keybindings
- override default split window key bindings
- Moving windows follows current window, compensate for change in behavior in
  tmux 3.0

### v1.0.0, 2014-08-30
- update readme to reflect github organization change
- update readme - more precise binding definition
- switch to tab indentation
- add swap-window bindings
- change "move window" key bindings to be more intuitive

### v0.0.2, 2014-06-03
- split-window bindings "|" and "-" now create a new pane with the same path as
  the original one the split started from.
- improve the default new-window "c" binding so it creates new windows with the
  same path as the current pane
- bugfix for "|", "-" and "c" bindings - setting the correct path in new windows
  wasn't working properly with "$PWD". Changed to "#{pane_current_path}".
- add other plugins list to the README

### v0.0.1, 2014-05-23
- first version out
