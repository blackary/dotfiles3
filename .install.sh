#!/bin/sh

curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
yadm clone git@github.com:blackary/dotfiles3.git
yadm bootstrap
