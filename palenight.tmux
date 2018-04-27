#!/usr/bin/env bash
# Copyright (c) 2017-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2017-present Sven Greb <code@svengreb.de>

# Project:    palenight tmux
# Repository: https://github.com/arcticicestudio/palenight-tmux
# License:    MIT
# References:
#   https://tmux.github.io

PALENIGHT_TMUX_COLOR_THEME_FILE=src/palenight.conf
PALENIGHT_TMUX_VERSION=0.2.0
PALENIGHT_TMUX_STATUS_CONTENT_FILE="src/palenight-status-content.conf"
PALENIGHT_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE="src/palenight-status-content-no-patched-font.conf"
PALENIGHT_TMUX_STATUS_CONTENT_OPTION="@palenight_tmux_show_status_content"
PALENIGHT_TMUX_NO_PATCHED_FONT_OPTION="@palenight_tmux_no_patched_font"
_current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

__cleanup() {
  unset -v PALENIGHT_TMUX_COLOR_THEME_FILE PALENIGHT_TMUX_VERSION
  unset -v PALENIGHT_TMUX_STATUS_CONTENT_FILE PALENIGHT_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE
  unset -v PALENIGHT_TMUX_STATUS_CONTENT_OPTION PALENIGHT_TMUX_NO_PATCHED_FONT_OPTION
  unset -v _current_dir
  unset -f __load __cleanup
}

__load() {
  tmux source-file "$_current_dir/$PALENIGHT_TMUX_COLOR_THEME_FILE"

  local status_content=$(tmux show-option -gqv "$PALENIGHT_TMUX_STATUS_CONTENT_OPTION")
  local no_patched_font=$(tmux show-option -gqv "$PALENIGHT_TMUX_NO_PATCHED_FONT_OPTION")

  if [ "$status_content" != "0" ]; then
    if [ "$no_patched_font" != "1" ]; then
      tmux source-file "$_current_dir/$PALENIGHT_TMUX_STATUS_CONTENT_FILE"
    else
      tmux source-file "$_current_dir/$PALENIGHT_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE"
    fi
  fi
}

__load
__cleanup
