# set C-a as the default prefix key combination
# and unbind C-b to free it up
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# Start window numbering at 1 (default => 0)
set -g base-index 1

set -g clock-mode-style 12

# Renumber windows after removing one
set -g renumber-windows on

# use 256 colors
set -g default-terminal "screen-256color"

# change tmux bar colors
set -g status-bg '#666666'
set -g status-fg '#aaaaaa'

# Keep plenty of history for scrollback
set -g history-limit 10000

# mouse
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on
setw -g mode-mouse on

bind m split-window -h 'reattach-to-user-namespace mutt'

# Use vim keybindings in copy mode
setw -g mode-keys vi
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

unbind -t vi-copy Space
bind -t vi-copy Space jump-again

bind y run 'tmux save-buffer - | reattach-to-user-namespace pbcopy '
bind C-y run 'tmux save-buffer - | reattach-to-user-namespace pbcopy '

# Smart pane switching with awareness of vim splits
# See this blog post for additional detail:
# http://robots.thoughtbot.com/post/53022241323/seamlessly-navigate-vim-and-tmux-splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim$' && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim$' && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim$' && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim$' && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim$' && tmux send-keys 'C-\\') || tmux select-pane -l"

# Secondary binding for C-l to retain redraw
bind C-l send-keys 'C-l'

# Easy rotating of panes
bind C-k swap-pane -U

# increase display time
set -g display-panes-time 1200

# status bar stuff
set -g status-left-length 40

# Simplify status bar display.
set -g status-left '[#S]'
set -g status-right "%I:%M %p "
# set -g status-right "#[fg=red][44%%]#[default]   -  %I:%M %p "

# Dismiss current pane to background window
bind b break-pane -d
bind-key j command-prompt -p "join pane from: "  "join-pane -h -s '%%'"

# more intuitive keybindings for splitting
bind \ split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"


# Easy return to Vim from tmux runner zoom runner pane
bind C-p run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim$' && tmux send-keys ':VtrZoomRunnerPane' 'C-m') || tmux send-keys 'C-c' && tmux select-pane -l"

# Make C-j display a selectable list of sessions
bind C-j choose-tree

# Keep window names as I set them
setw -g automatic-rename off

# The base index for windows and panes to 1 instead of the default 0.
# # Now prefix 1 is the first window instead of a prefix 0 being the first.
set -g base-index 1
# setw -g pane-base-index 1 # not recognized by my tmux

# Reload tmux.conf with prefix-r
bind C-r source-file ~/.tmux.conf \; display "Reloaded ~/.tmux.conf"

# Set the term environment variable when using tmux
set -g default-terminal "screen-256color"

# Provide access to the clipboard for pbpaste, pbcopy (details: http://goo.gl/DN82E)
set-option -g default-command "reattach-to-user-namespace -l zsh -l"
set-window-option -g automatic-rename on
>>>>>>> Stashed changes

# use send-prefix to pass ` (tic) through to application
#bind ` send-prefix

# shorten command delay
set -sg escape-time 1

# set window and pane index to 1 (0 by default)
set-option -g base-index 1
setw -g pane-base-index 1

# reload ~/.tmux.conf using PREFIX r
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# use PREFIX | to split window horizontally and PREFIX - to split vertically
bind | split-window -h
bind - split-window -v

# Make the current window the first window
bind T swap-window -t 1

# map Vi movement keys as pane movement keys
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# and use C-h and C-l to cycle thru panes
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# resize panes using PREFIX H, J, K, L
bind H resize-pane -L 5
bind J resize-pane -D 5
bind K resize-pane -U 5
bind L resize-pane -R 5

# C-i for even-vertical arrangement and C-o to zoom current pane
bind-key C-i select-layout even-vertical
bind-key C-v select-layout even-horizontal
bind-key C-o resize-pane -y 1000

# Sync panes
bind C-s set-window-option synchronize-panes

# explicitly disable mouse control
# setw -g mode-mouse off
# set -g mouse-select-pane off
# set -g mouse-resize-pane off
# set -g mouse-select-window off

# mouse control for tmux v2.1
# set -g mouse off

# ---------------------
# Copy & Paste
# ---------------------
# provide access to the clipboard for pbpaste, pbcopy
# set -g default-command "reattach-to-user-namespace -l $SHELL; cd ."
# set-option -g default-command "reattach-to-user-namespace -l zsh"
# set-window-option -g automatic-rename on

# use vim keybindings in copy mode
# setw -g mode-keys vi

# setup 'v' to begin selection as in Vim
# bind-key -t vi-copy v begin-selection
# bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

# update default binding of 'Enter' to also use copy-pipe
# unbind -t vi-copy Enter
# bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

# bind y run 'tmux save-buffer - | reattach-to-user-namespace pbcopy '
# bind C-y run 'tmux save-buffer - | reattach-to-user-namespace pbcopy '

# Save entire tmux history to a file - file will be on machine where tmux is
# running
# bind-key * command-prompt -p 'save history to filename:' -I '~/tmux.history' 'capture-pane -S -32768 ; save-buffer %1 ; delete-buffer'

# -----------------------
# Multistart panes
# ----------------------
#bind-key P run-shell 'tmux-multistart as'
#bind-key A run-shell 'tmux-multistart alpha'
#bind-key B run-shell 'tmux-multistart beta'
#bind-key W run-shell 'tmux-multistart web'
#bind-key D run-shell 'tmux-multistart dev'
#bind-key T run-shell 'tmux-multistart txhub'

#bind-key C command-prompt -p "machine(s)/group: " "run-shell 'tmux-multistart %1'"

# ----------------------
# set some pretty colors
# ----------------------
# set pane colors - hilight the active pane
#set-option -g pane-border-fg colour235 #base02
#set-option -g pane-active-border-fg colour33 #blue
#set-option -g pane-active-border-fg colour240 #base01

# colorize messages in the command line
set-option -g message-bg black #base02
set-option -g message-fg brightred #orange

# ----------------------
# Status Bar
# -----------------------
set-option -g status on                # turn the status bar on
#set -g status-utf8 on                  # set utf-8 for the status bar
set -g status-interval 5               # set update frequencey (default 15 seconds)
set -g status-justify centre           # center window list for clarity
# set-option -g status-position top    # position the status bar at top of screen

# visual notification of activity in other windows
setw -g monitor-activity on
set -g visual-activity on

# set color for status bar
#set-option -g status-bg colour235 #base02
#set-option -g status-fg yellow #yellow
#set-option -g status-attr dim 

# set window list colors - red for active and cyan for inactive
#set-window-option -g window-status-fg brightblue #base0
#set-window-option -g window-status-bg colour236 
#set-window-option -g window-status-attr dim

#set-window-option -g window-status-current-fg brightred #orange
#set-window-option -g window-status-current-bg colour236 
#set-window-option -g window-status-current-attr bright

# show host name and IP address on left side of status bar
set -g status-left-length 85 
set -g status-left "#[fg=green]: #h : #[fg=brightblue]#(dig +short myip.opendns.com @resolver1.opendns.com) #[fg=yellow]#(ifconfig en0 | grep 'inet ' | awk '{print \"en0 \" $2}') #(ifconfig en1 | grep 'inet ' | awk '{print \"en1 \" $2}') #(ifconfig en3 | grep 'inet ' | awk '{print \"en3 \" $2}') #[fg=red]#(ifconfig tun0 | grep 'inet ' | awk '{print \"vpn \" $2}') #[fg=green]#(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F': ' '/ SSID/{print $2}') "
#set -g status-left "#[fg=green]: #h : #[fg=brightblue]#(curl icanhazip.com) #[fg=yellow]#(ifconfig en0 | grep 'inet ' | awk '{print \"en0 \" $2}') #(ifconfig en1 | grep 'inet ' | awk '{print \"en1 \" $2}') #(ifconfig en3 | grep 'inet ' | awk '{print \"en3 \" $2}') #[fg=red]#(ifconfig tun0 | grep 'inet ' | awk '{print \"vpn \" $2}') #[fg=green]#(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F': ' '/ SSID/{print $2}') "
#set -g status-left "#[fg=green]: #h : #[fg=yellow]#(ifconfig en0 | grep 'inet ' | awk '{print \"en0 \" $2}') #(ifconfig en1 | grep 'inet ' | awk '{print \"en1 \" $2}') #(ifconfig en3 | grep 'inet ' | awk '{print \"en3 \" $2}') #[fg=red]#(ifconfig tun0 | grep 'inet ' | awk '{print \"vpn \" $2}') #[fg=green]#(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F': ' '/ SSID/{print $2}') "

# Show hostname, load averages, and an prefix key indicator
#set -g status-left "#[fg=green]: #h : #[fg=yellow]#(uptime | rev | cut -d ' ' -f 1-3 | rev) #{?client_prefix,#[fg=colour2]^A,} "


# show session name, window & pane number, date and time on right side of
# status bar
set -g status-right-length 80
set -g status-right "#[fg=cyan]#{=15:pane_title} : #[fg=blue]#S #I:#P #[fg=yellow]: %d %b %Y #[fg=green]: %l:%M %p : #(date -u | awk '{print $4}') :"

#Solarized 256 colorscheme
#### COLOUR (Solarized 256)

# default statusbar colors
set-option -g status-bg colour235 #base02
set-option -g status-fg colour136 #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour244 #base0
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour166 #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green

# bell
set-window-option -g window-status-bell-style fg=colour235,bg=colour160 #base02, red
