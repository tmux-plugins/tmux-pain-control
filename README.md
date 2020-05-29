# Tmux Pain Control

Tmux plugin for controlling panes. Adds standard pane navigation bindings.

So far, you had to google around and comb other people's dotfiles to find these.
This plugin hopefully makes them more available and "more standard".

Thanks to the Tmux community for "inventing" these bindings. I've merely just
copied them here.

Tested and working on Linux, OSX and Cygwin.

### Bindings

Notice most of the bindings emulate vim cursor movements.

<img align="right" src="/screenshots/pane_navigation.gif" alt="pane navigation"/>

**Navigation**

- `prefix + h` and `prefix + C-h`<br/>
  select pane on the left
- `prefix + j` and `prefix + C-j`<br/>
  select pane below the current one
- `prefix + k` and `prefix + C-k`<br/>
  select pane above
- `prefix + l` and `prefix + C-l`<br/>
  select pane on the right

<br/>

**Note**: This overrides tmux's default binding for toggling between last
active windows, `prefix + l`.
[tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) gives you
a better binding for that, `prefix + a` (if your prefix is `C-a`).

<br/><br/>

<img align="right" src="/screenshots/pane_resizing.gif" alt="pane resizing"/>

**Resizing panes**

- `prefix + shift + h`<br/>
  resize current pane 5 cells to the left
- `prefix + shift + j`<br/>
  resize 5 cells in the down direction
- `prefix + shift + k`<br/>
  resize 5 cells in the up direction
- `prefix + shift + l`<br/>
  resize 5 cells to the right

These mappings are `repeatable`.

The amount of cells to resize can be configured with `@pane_resize` option. See
[configuration section](#configuration) for the details.

<br/><br/>

<img align="right" src="/screenshots/pane_splitting.gif" alt="pane splitting"/>

**Splitting panes**

- `prefix + |`<br/>
  split current pane horizontally
- `prefix + -`<br/>
  split current pane vertically
- `prefix + \`<br/>
  split current pane full width horizontally
- `prefix + _`<br/>
  split current pane full width vertically

Newly created pane always has the same path as the original pane.

<br/><br/><br/><br/><br/>

**Swapping windows**

- `prefix + <` - moves current window one position to the left
- `prefix + >` - moves current window one position to the right

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'tmux-plugins/tmux-pain-control'

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

To disable certain keys from being mapped by this plugin you can set
`@disabled_keys` to a comma-separated list of keys. It is empty by default, ie.
all keys will be mapped.

Examples:

    # Disable | mapping
    set-options -g @disabled_keys "|"
    # Disable mapping of H, J, K and L
    set-options -g @disabled_keys "H,J,K,L"

### Other plugins

You might also find these useful:

- [sessionist](https://github.com/tmux-plugins/tmux-sessionist) - lightweight
  tmux utils for switching and creating sessions
- [logging](https://github.com/tmux-plugins/tmux-logging) - easy logging and
  screen capturing

### License
[MIT](LICENSE.md)
