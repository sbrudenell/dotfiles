#!/bin/bash

cd $(dirname "$0")

[ ! -f ~/.vimrc ] && ln -sr vimrc ~/.vimrc
[ ! -d ~/.vim ] && ln -sr vim ~/.vim
[ ! -f ~/.screenrc ] && ln -sr screenrc ~/.screenrc
[ ! -f ~/.astylerc ] && ln -sr astylerc ~/.astylerc

[ -f /etc/lsb-release ] && source /etc/lsb-release

[ "x$DISTRIB_ID" == "xUbuntu" ] && {
  sudo apt-get install $(cat packages-ubuntu)
}

vim +PluginInstall +qall
