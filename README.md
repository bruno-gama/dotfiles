# My Personal Dotfiles

**Work in progress**, these are the dotfiles I use both for personal and
professional projects, either on MacOS or Linux.

## Config files included are:

* .tmux.conf
* .tmux.conf.local
* .vimrc
* .zshrc
* .config/i3/config
* .config/i3status/config
* .config/compton/compton.conf
* .xprofile
* .mutt/muttrc
* .mailcap

## Requirements

* [Vundle](https://github.com/VundleVim/Vundle.vim)

## Vim plugins extra setup

The languageclient and youcompleteme plugins require an extra setup step

For languageclient
  * go to `~/.vim/bundle/languageclient`
  * run `bash install.sh`

For ycm:
  * go to `~/.vim/bundle/youcompleteme`
  * run `python install.py`

## I3 Window Manager extra setup

In order for the brightness control keys to work properly, you'll need to have
brightlight installed:

  * clone the [brightlight repo](https://github.com/multiplexd/brightlight)
  * compile from source (run `make`)
  * install to bin folder with setuid root

The I3 configuration takes the following packages for granted, so you should
install them with your package manager:

  * `xss-lock`
  * `playerctl`
  * `flameshot`
  * `caffeine`

## Mutt email extra setup

Copy the contents of the `mutt` folder to `~/.mutt`, `muttrc` can be a symlink,
but the other files will need to be edited.

* `mutt/accounts/example` is a template for creating a config file for each email account you want to configure
* `mutt/accounts/index` is the file that handles changing configuration depending on current folder
