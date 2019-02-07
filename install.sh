#!/bin/bash

VIMRC="./.vimrc"
ZSHRC="./.zshrc"
OHMYZSH=$HOME/.oh-my-zsh



[[ -f $VIMRC && -f $ZSHRC ]]
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


