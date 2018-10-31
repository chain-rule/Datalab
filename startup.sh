#!/bin/bash

if [ ! -d ~/.development ]; then
  git clone https://github.com/IvanUkhov/.development.git ~/.development && make -C ~/.development
fi

if [ ! -d ~/.vim ]; then
  git clone https://github.com/IvanUkhov/.vim.git ~/.vim --recursive && make -C ~/.vim
fi

if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
  ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
fi

rm -rf /root/.ssh
ln -s ~/.ssh /root/.ssh

if [ ! -f ~/.bashrc ]; then
  echo 'source activate py3env' >> ~/.bashrc
  echo 'source ~/.development/bashrc' >> ~/.bashrc
  echo 'export TERM=screen-256color-bce' >> ~/.bashrc
fi

if [ ! -f ~/.config/matplotlib/matplotlibrc ]; then
  mkdir -p ~/.config/matplotlib
  echo 'backend: Agg' >> ~/.config/matplotlib/matplotlibrc
fi

/datalab/run.sh
