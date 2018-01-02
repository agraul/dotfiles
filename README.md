### configuration files

This repo contains my configuration *(dot-)* files since I don't want to manually redo my configuration
for each system individually. The structure is compatible with GNU Stow and intended to be used with it.

#### How To: GNU Stow

Using Stow is simple:

1. install stow (e.g. `zypper in stow`)
1. Clone this repo to `~/dotfiles`
1. `cd ~/dotfiles`
1. `stow $APPLICATION` to create symlinks for `$APPLICATION`, e.g. `stow bash`)

The destination of symlinks created by stow is determined by the directory structure inside `~/dotfiles`.
Examples:
```
~/dotfiles/bash/
                .bashrc
-> ~/.bashrc
~/dotfiles/nvim/
                .config/
                        nvim/
                             init.vim
                             after/
-> ~/.config/nvim/init.vim && ~/.config/nvim/after/
```
