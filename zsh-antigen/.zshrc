# Environmental stuff
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/id_rsa"
export PAGER='less'
export EDITOR='nvim'
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# --------------------------------------------------------------
# aliases
# --------------------------------------------------------------
# movement
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias lh='ls -d .* --color=auto' # show hidden files/directories only
alias lsd='ls -aFhlG --color=auto'
alias la='ls -al --color=auto'
alias ls='ls -GFh --color=auto'
alias ll='ls -GFhl --color=auto'

# git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gb='git branch'
alias gc='git checkout'
alias gpu='git pull'
alias gcl='git clone'
alias gh='git hist' # hist is a .gitconfig alias

# applications
alias py='python3'
alias py2='python'
alias gdb='gdb -q'
alias rt='sudo rails test'

# pcscd on / off (yubikey / GPG)
alias pcscdon="sudo systemctl start pcscd"
alias pcscdoff="sudo systemctl stop pcscd"

# easy c++ compiling
alias cppcompile="g++ -Wall -Wextra -Wundef -Wfloat-equal -g -o a.o main.cpp"

# -------------------------------------------------------------
# sourcing other things
# -------------------------------------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


source /usr/share/antigen.zsh
# -------------------------------------------------------------
# antigen plugin configuration
# -------------------------------------------------------------

# use oh-my-zsh repo
antigen use oh-my-zsh

# choose plugins
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle rsync
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle history-substring-search

antigen theme avit

antigen apply

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
