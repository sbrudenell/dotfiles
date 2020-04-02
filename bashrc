export XTERM=xterm-color
export EDITOR=vim
export PATH="$PATH:$HOME/.local/bin"
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
# For OSX
export CLICOLOR=1

[ -f ~/.bashrc_local ] && source ~/.bashrc_local
