#!/bin/bash

DAHVCONF=$(dirname $0)

echo 'Setting up links...'
ln -s $DAHVCONF/.zshrc
ln -s $DAHVCONF/.vimrc
ln -s $DAHVCONF/.tmux.conf $HOME/.tmux.conf
ln -s $DAHVCONF/.tmux.powerline.conf $HOME/.tmux.powerline.conf

echo 'Downloading ohmyzsh'
pushd $DAHVCONF
git submodule update --init
cp ./snow.zsh-theme .oh-my-zsh/themes/snow.zsh-theme
popd
ln -s $DAHVCONF/.oh-my-zsh ~/.oh-my-zsh

if [ $(basename $SHELL) != 'zsh' ]; then
  echo 'Setting shell to zsh...'

  if [ -z "$(which zsh)" ]; then
    echo 'zsh not installed'
    exit 1
  fi

  sudo chsh "$(which zsh)"
fi
