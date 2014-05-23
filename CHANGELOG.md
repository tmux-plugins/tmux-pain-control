# Changelog

### master
- split-window bindings "|" and "-" now create a new pane with the same path as
  the original one the split started from.
- improve the default new-window "c" binding so it creates new windows with the
  same path as the current pane
- bugfix for "|", "-" and "c" bindings - setting the correct path in new windows
  wasn't working properly with "$PWD". Changed to "#{pane_current_path}".

### v0.0.1, 2014-05-23
- first version out
