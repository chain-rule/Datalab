#!/bin/bash

if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
  ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed25519
fi

rm -rf /root/.ssh
ln -s ~/.ssh /root/.ssh

if [ ! -f ~/.zshrc ]; then
  echo "emulate bash -c 'source activate py3env'" >> ~/.zshrc
  echo 'TERM=xterm-256color' >> ~/.zshrc
fi

if [ ! -d ~/.development ]; then
  git clone https://github.com/IvanUkhov/.development.git ~/.development && make -C ~/.development
fi

if [ ! -d ~/.vim ]; then
  git clone https://github.com/IvanUkhov/.vim.git ~/.vim --recursive && make -C ~/.vim
fi

if [ ! -f ~/.config/matplotlib/matplotlibrc ]; then
  mkdir -p ~/.config/matplotlib
  echo 'backend: Agg' >> ~/.config/matplotlib/matplotlibrc
fi

/datalab/run.sh
