#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/zachary/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install yadm
yadm clone git@github.com:blackary/dotfiles3.git
yadm bootstrap
