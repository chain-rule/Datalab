#!/bin/bash

apt-get update
apt-get install -y htop psmisc tmux vim

rm -rf /usr/local/envs/py3env/lib/python3.5/site-packages/dill*
rm -rf /usr/local/envs/py3env/lib/python3.5/site-packages/seaborn*
