# **neovim-config**

Welcome to my repo used for keeping my Neovim configuration files that are important for me whenever I setup a new system that I use neovim regularly on.

This project is licensed under the terms of the [MIT license](https://github.com/Tenn1518/neovim-config/blob/master/LICENSE).

 Plugins | Description
 ------- | -----------
 [vim-plug](https://github.com/junegunn/vim-plug) | Minimalist vim plugin manager
 [unite.vim](https://github.com/https://github.com/Shougo/unite.vim) | Used to create interfaces, dependency of vim-fugitive
 [vim-airline](https://github.com/vim-airline/vim-airline) | Lean & mean status/tabline that's light as air
 [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) | A collection of themes for vim-airline
 [vim-bufferline](https://github.com/bling/vim-bufferline) | super simple vim plugin to show the list of buffers in the command bar |
 [vim-fugitive](https://github.com/tpope/vim-fugitive) | A Git wrapper for vim
 [vim-sensible](https://github.com/tpope/vim-sensible) | Defaults everyone can agree on
 [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) | Precision colorscheme for the vim text editor
 [ag.vim](https://github.com/vim-scripts/ag.vim) | ag, the_silver_searcher (better than ack, which is better than grep)
 [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) | Fuzzy file, buffer, mru, tag, etc finder
 [NERDTree](https://github.com/scrooloose/nerdtree) | A tree explorer plugin for vim

#### How do I use these files?
First, you'll (obviously) need [Neovim](https://github.com/neovim/neovim), though ordinary [Vim](https://github.com/vim/vim) may work also (but the following instructions will not work for Vim). You need to clone this repository and move it to $XDG_CONFIG_HOME/nvim.

In order to use vim-colors-solarized, you will need to download and install the solarized colorschemes for your terminal emulator. Without the solarized colorscheme enabled, your vim session will look very ugly. If you really don't want to use the solarized colorscheme or can't use it because your terminal emulator doesn't support it, comment lines 51-53 and line 67, and uncomment line 72 in init.vim.


Vim-airline is set up to use powerline symbols. If you don't already have pre-patched Powerline fonts, you can clone the [powerline/fonts](https://github.com/powerline/fonts) repo and run install.sh from inside the repository. Clone it with:
```
git clone https://github.com/powerline/fonts
```
And install it with:
```
cd fonts
bash install.sh
```
You'll then need to set a Powerline-patched font as your terminal font. I use "Ubuntu Mono deriative Powerline Regular" 14pt. If you are on OS X, Menlo seems like a popular choice.

CtrlP.vim is set to use ag.vim, which depends on the_silver_searcher being installed. You'll need to install the_silver_searcher with your Linux distro's package manager or Homebrew or Ports for Mac. To install on Mac, install Homebrew and then run:
```
brew install the_silver_searcher
```
On Ubuntu or Debian, run:
```
sudo apt-get install silversearcher-ag
```
On Fedora, run:
```
sudo dnf install the_silver_searcher
```
On Arch Linux, run:
```
sudo pacman -S the_silver-searcher
```

##### On Mac/Linux/BSD:
```
git clone --recursive https://github.com/Tenn1518/neovim-config ~/.config/nvim
```
If you get an error when entering neovim, don't worry. That's to be expected, since your plugins aren't installed yet. Install them with:
```
:PlugInstall
```
inside neovim.
That's it! Surprised?

##### On Windows
I don't really know a simple way to clone the repo and move it to ~/AppData/Local/nvim since I don't have a Windows system to test that, so just clone this repository and move the folder to ~/AppData/Local/nvim.

#### To-Do
Add more plugins and stuffs

That's pretty much it.

#### Plugins?
Plugins are managed by vim-plug, a minimalist vim plugin manager. To install plugins, run ":PlugInstall". To update plugins, run ":PlugUpdate".
