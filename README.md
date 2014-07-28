# Tmux Pain Control

Tmux plugin for controlling panes. Adds standard pane navigation bindings.

So far, you had to google around and comb other people's dotfiles to find these.
This plugin hopefully makes them more available and "more standard".

Thanks to the Tmux community for "inventing" these bindings. I've merely just
copied them here.

### Bindings

Notice most of the bindings emulate vim cursor movements.

<img align="right" src="/screenshots/pane_navigation.gif" alt="pane navigation"/>

<br/>

**Navigation**

- `h` - select pane on the left
- `j` - select pane below the current one
- `k` - select pane above
- `l` - select pane on the right

<br/><br/><br/><br/><br/>

<img align="right" src="/screenshots/pane_resizing.gif" alt="pane resizing"/>

**Resizing panes**

- `H` - resize current pane 5 cells to the left
- `J` - resize 5 cells in the up direction
- `K` - resize 5 cells in the down direction
- `L` - resize 5 cells to the right

These mappings are `repeatable`.

The amount of cells to resize can be configured with `@pane_resize` option. See
[configuration section](#configuration) for the details.

<br/><br/>

<img align="right" src="/screenshots/pane_splitting.gif" alt="pane splitting"/>

<br/>

**Splitting panes**

- `|` - split current pane horizontally
- `-` - split current pane vertically

Newly created pane always has the same path as the original pane.

<br/><br/><br/><br/><br/>

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @tpm_plugins "                \
      tmux-plugins/tpm                   \
      tmux-plugins/tmux-pain-control     \
    "

Hit `prefix + I` to fetch the plugin and source it.

You should now have all `pain-control` bindings defined.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/tmux-plugins/tmux-pain-control ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/pain_control.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

You should now have all `pain-control` bindings defined.

### Configuration

You can set `@pane_resize` Tmux option to choose number of resize cells for the
resize bindings. "5" is the default.

Example:

    set-option -g @pane_resize "10"

### Other plugins

You might also find these useful:

- [goto session](https://github.com/tmux-plugins/tmux-goto-session) - faster session
  switching
- [logging](https://github.com/tmux-plugins/tmux-logging) - easy logging and
  screen capturing

### License
[MIT](LICENSE.md)
