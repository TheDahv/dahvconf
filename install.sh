#!/bin/bash

DAHVCONF=$(dirname $0)

if [ -z "$(which apt-get)" ]; then
  sudo apt-get install -y \
    vim \
    tmux \
    git \
    build-essential \
    cmake \
    python-dev python3-dev
fi

echo 'Setting up links...'
ln -s $DAHVCONF/.zshrc $HOME/.zshrc
ln -s $DAHVCONF/.vimrc $HOME/.vimrc
ln -s $DAHVCONF/.tmux.conf $HOME/.tmux.conf
ln -s $DAHVCONF/.tmux.powerline.conf $HOME/.tmux.powerline.conf
ln -s $DAHVCONF/.gitconfig $HOME/.gitconfig
ln -s $DAHVCONF/.gitignore $HOME/.gitignore

echo 'Downloading ohmyzsh'
pushd $DAHVCONF
git submodule update --init
cp ./snow.zsh-theme .oh-my-zsh/themes/snow.zsh-theme
popd
ln -s $DAHVCONF/.oh-my-zsh ~/.oh-my-zsh

echo 'Installing Vim dependencies'
mkdir -p ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp -r $DAHVCONF/.vim/colors ~/.vim/colors

if [ -z "$(which fzf)" ]; then
  echo 'Setting up fzf...'
  sudo mkdir -p /opt/fzf
  sudo chown -R $(whoami) /opt/fzf

  pushd /opt/fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git .
  ./install
  popd
fi

if [ ! -f $HOME/.nvm/nvm.sh ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh \
    | bash
fi

if [ $(basename $SHELL) != 'zsh' ]; then
  echo 'Setting shell to zsh...'

  if [ -z "$(which zsh)" ]; then
    echo 'zsh not installed'
    exit 1
  fi

  sudo chsh $(whoami) -s "$(which zsh)"
fi
