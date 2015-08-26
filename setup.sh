#!/bin/bash

cd $(dirname "$0")

[ ! -f ~/.vimrc ] && ln -sr vimrc ~/.vimrc
[ ! -d ~/.vim ] && ln -sr vim ~/.vim
[ ! -f ~/.screenrc ] && ln -sr screenrc ~/.screenrc
[ ! -f ~/.astylerc ] && ln -sr astylerc ~/.astylerc

if [ ! -f ~/.bashrc_local ]; then
  [ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc_local
  [ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile_local
  ln -sr bash_profile ~/.bash_profile
  ln -sr bashrc ~/.bashrc
fi

[ -f /etc/lsb-release ] && source /etc/lsb-release

[ "x$DISTRIB_ID" == "xUbuntu" ] && {
  sudo apt-get install $(cat packages-ubuntu)
}

vim +PluginInstall +qall
