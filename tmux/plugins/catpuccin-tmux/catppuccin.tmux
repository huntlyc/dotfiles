#!/usr/bin/env bash

CATPUCCIN_TMUX_COLOR_THEME_FILE=catppuccin.conf
_current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

__cleanup() {
  unset -v CATPUCCIN_TMUX_COLOR_THEME_FILE
  unset -v _current_dir
  unset -f __load __cleanup
}

__load() {
  tmux source-file "$_current_dir/$CATPUCCIN_TMUX_COLOR_THEME_FILE"
}

__load
__cleanup
