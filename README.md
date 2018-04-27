#### tmux Plugin Manager

The recommended method to install palenight tmux is via [`tpm`](https://github.com/tmux-plugins/tpm).

Add palenight tmux to your `~/.tmux.conf`

```sh
set -g @plugin 'tonylambiris/palenight-tmux'
```

and press the default key binding `prefix` + <kbd>I</kbd> to fetch- and install the plugin.

#### Manual

[Clone the repository](https://help.github.com/articles/cloning-a-repository)

```sh
git clone https://github.com/tonylambiris/palenight-tmux ~/.tmux/themes/palenight-tmux
```
and source the downloaded theme by adding it to the bottom of your `~/.tmux.conf`.

```sh
run-shell "~/.tmux/themes/palenight-tmux/palenight.tmux"
```

Reload your `~/.tmux.conf` file to source- and activate the theme.

```sh
tmux source-file `~/.tmux.conf`
```

## Features
<p align="center"><strong>Optimized styles for command bar- and widgets</strong></p>

<p align="center"><strong>Fits to many terminal applications based on palenight</strong></p>

## Configuration

### Disable status content

By default, this theme provides status bar content (including the powerline-styled
background arrows).

The status content can be disabled by setting the `@palenight_tmux_show_status_content` to `0`:

```sh
set -g @palenight_tmux_show_status_content "0"
```

#### No patched fonts

The default status content makes use of patched fonts which can be disabled by setting the `@palenight_tmux_no_patched_font` variable to `1`:

```sh
set -g @palenight_tmux_no_patched_font "1"
```

## Plugin Support
### [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)
Supports the *prefix*- and `copy-mode` status indicator.

