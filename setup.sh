#!/bin/bash

cd $(dirname "$0")
relpath=$(python2 -c "import os; print os.path.relpath('$PWD', '$HOME')")

[ ! -f ~/.vimrc ] && ln -s "$relpath/vimrc" ~/.vimrc
[ ! -d ~/.vim ] && ln -s "$relpath/vim" ~/.vim
[ ! -f ~/.screenrc ] && ln -s "$relpath/screenrc" ~/.screenrc
[ ! -f ~/.astylerc ] && ln -s "$relpath/astylerc" ~/.astylerc

if [ ! -f ~/.bashrc_local ]; then
  [ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc_local
  [ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile_local
  ln -s "$relpath/bash_profile" ~/.bash_profile
  ln -s "$relpath/bashrc" ~/.bashrc
fi

[ -f /etc/lsb-release ] && source /etc/lsb-release

[ "x$DISTRIB_ID" == "xUbuntu" ] && {
  sudo apt-get install $(cat packages-ubuntu)
  pip install --upgrade $(cat pips)
}
[ "x$DISTRIB_ID" == "xGentoo" ] && {
  sudo emerge -v $(cat packages-gentoo)
}

vim +PluginInstall +qall
