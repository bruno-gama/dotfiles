# My Personal Dotfiles

**Work in progress**, these are the dotfiles I use both for personal and
professional projects, either on MacOS or Linux.

## Dotfiles included are:

* .tmux.conf
* .tmux.conf.local
* .vimrc
* .zshrc

## Requirements

* [Vundle](https://github.com/VundleVim/Vundle.vim)

## To do

* add .bashrc
* add configs for sublime
* add configs for fish

## Vim plugins extra setup

The languageclient and youcompleteme plugins require an extra setup step

For languageclient
  * go to `~/.vim/bundle/languageclient`
  * run `bash install.sh`

For ycm:
  * go to `~/.vim/bundle/youcompleteme`
  * run `python install.py`

