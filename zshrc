# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/home/alex/go/bin:/usr/share/go/contrib/bin:/usr/sbin/


# Path to your oh-my-zsh installation.
export ZSH=/home/alex/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="michelebologna"
#ZSH_THEME="lukerandall"
#ZSH_THEME="af-magic"
#ZSH_THEME="simple"
ZSH_THEME="blinks"
#ZSH_THEME="bureau"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found sudo vi-mode)
#ZSH_TMUX_AUTOSTART="true"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# openSUSE
alias zse="zypper search"
alias zin="sudo zypper install"
alias zrm="sudo zypper remove"
alias zps="zypper ps -s"
alias zpsr="sudo zypper ps -s"
alias zup="sudo zypper ref && sudo zypper dup --no-allow-vendor-change"
alias zif="zypper info"
alias zshr="sudo zypper sh"
alias zref="sudo zypper ref"

# python
alias py="python"
alias py3="python3"

# steam fix
alias steam="LIBGL_DRI3_DISABLE=1 steam"

# mount /dev/sdb1
alias sdb1temp="sudo mount /dev/sdb1 ~/temp"

# netflix in chromium kiosk
alias netflix="chromium --user-data-dir=chromium-netflix --kiosk https://netflix.com"

# pcscd on / off
alias pcscdon="sudo systemctl start pcscd"
alias pcscdoff="sudo systemctl stop pcscd"

# hybrid-sleep
alias sleep="systemctl hybrid-sleep"
