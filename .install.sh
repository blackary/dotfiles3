#!/bin/sh

git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project
~/.yadm-project clone git@github.com:blackary/dotfiles3.git
yadm bootstrap
