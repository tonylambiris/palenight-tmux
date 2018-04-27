#!/usr/bin/env bash

PALENIGHT_TMUX_COLOR_THEME_FILE="theme/palenight.conf"
PALENIGHT_TMUX_STATUS_CONTENT_FILE="theme/palenight-status-content.conf"
PALENIGHT_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE="theme/palenight-status-content-no-patched-font.conf"
PALENIGHT_TMUX_STATUS_CONTENT_OPTION="@palenight_tmux_show_status_content"
PALENIGHT_TMUX_NO_PATCHED_FONT_OPTION="@palenight_tmux_no_patched_font"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

__cleanup() {
  unset -v PALENIGHT_TMUX_COLOR_THEME_FILE PALENIGHT_TMUX_VERSION
  unset -v PALENIGHT_TMUX_STATUS_CONTENT_FILE PALENIGHT_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE
  unset -v PALENIGHT_TMUX_STATUS_CONTENT_OPTION PALENIGHT_TMUX_NO_PATCHED_FONT_OPTION
  unset -v CURRENT_DIR
  unset -f __load __cleanup __source
}

__load() {
  local status_content no_patched_font

  __source "$CURRENT_DIR/$PALENIGHT_TMUX_COLOR_THEME_FILE"

  status_content=$(tmux show-option -gqv "$PALENIGHT_TMUX_STATUS_CONTENT_OPTION")
  no_patched_font=$(tmux show-option -gqv "$PALENIGHT_TMUX_NO_PATCHED_FONT_OPTION")

  if [ "$status_content" != "0" ]; then
    if [ "$no_patched_font" != "1" ]; then
      __source "$CURRENT_DIR/$PALENIGHT_TMUX_STATUS_CONTENT_FILE"
    else
      __source "$CURRENT_DIR/$PALENIGHT_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE"
    fi
  fi
}

__source() {
  test -z $1 || tmux source-file -q "$1"
}

__load
__cleanup
