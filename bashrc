# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

# If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

test -s ~/.alias && . ~/.alias || true

#Aliases
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a -l --color=auto'
alias l.='ls -d .* --color=auto'
alias rm='rm -Iv'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias vi='nvim'
alias py='python3'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '
alias sshec2="ssh -i ~/amazon-ssh-keys.pem ec2-user@ec2-52-33-72-90.us-west-2.compute.amazonaws.com"
alias sftpec2="sftp -i ~/amazon-ssh-keys.pem ec2-user@ec2-52-33-72-90.us-west-2.compute.amazonaws.com"
alias cl='clear'

#quick battery stats
alias batst="cat /sys/class/power_supply/BAT0/status && cat /sys/class/power_supply/BAT0/capacity"
# weather information
alias wttr="curl wttr.in/Hamburg"


# Locale and editor
export EDITOR=nvim
export BROWSER="firefox '%s' &"	

#Prompt
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'
LGRAY='\[\033[0;37m\]'
#PS1="${BLUE}(${RED}\w${BLUE}) ${NORMAL}\u@\h ${RED}\$ ${NORMAL}"
PS1="\u@\h ${GREEN}[\w] ${RED}\$${NORMAL} "

# source /home/alex/herbstluftwm/share/herbstclient-completion
