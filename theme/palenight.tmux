##########################################################
# palenight - https://github.com/tonylambiris/tmux-palenight
##########################################################

# default statusbar colors
set-option -g status-bg colour235 # dark grey
set-option -g status-fg colour158  # light green
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour244 # grey
set-window-option -g window-status-bg default
set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour86 # mint green
set-window-option -g window-status-current-bg default
set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 # dark grey
set-option -g pane-active-border-fg colour135 # purple

# message text
set-option -g message-bg colour235 # dark grey
set-option -g message-fg colour219 # pink

# pane number display
set-option -g display-panes-active-colour colour135 # purple
set-option -g display-panes-colour colour244 # grey

# clock
set-window-option -g clock-mode-colour colour74 # blue

# select mode
set-option -g mode-bg colour116 # light blue
set-option -g mode-fg colour235 # dark grey
