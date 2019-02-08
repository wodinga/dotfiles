#!/bin/bash

VIMRC="./.vimrc"
ZSHRC="./.zshrc"
OHMYZSH=$HOME/.oh-my-zsh
SSHPUBKEY=$HOME/.ssh/.id_rsa.pub
brewPkgs=(cf-cli gdbm git git-lfs gradle icu4c mongodb nvm nyancat openssl pkg-config vault yarn zsh-completions)

# Check if Oh My Zsh is installed
if [[ -d $OHMYZSH ]]
then
	echo -e "Oh My Zsh is already installed"
else
	echo -e "Oh My Zsh is not installed"
	# Install Oh My Zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Check if homebrew is installed
if [[ -x $(which brew) ]] 
then
	echo -e "Brew exists\n"
	brew update

else
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install ${brewPkgs[@]} 
fi

# Generate default ssh key 
# ssh-keygen

