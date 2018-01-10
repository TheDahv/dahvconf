#!/bin/bash

DAHVCONF=$(dirname $0)

echo 'Setting up links...'
ln -s $DAHVCONF/.zshrc
ln -s $DAHVCONF/.vimrc
ln -s $DAHVCONF/.oh-my-zsh $HOME/.oh-my-zsh
ln -s $DAHVCONF/.tmux.conf $HOME/.tmux.conf
ln -s $DAHVCONF/.tmux.powerline.conf $HOME/.tmux.powerline.conf

if [ $(basename $SHELL) != 'zsh' ]; then
  echo 'Setting shell to zsh...'

  if [ -z "$(which zsh)" ]; then
    echo 'zsh not installed'
    exit 1
  fi

  sudo chsh "$(which zsh)"
fi
