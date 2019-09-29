#!/bin/bash

VIMRC=".vimrc"
ZSHRC=".zshrc"
OHMYZSH=$HOME/.oh-my-zsh
SSHPUBKEY=$HOME/.ssh/.id_rsa.pub

xcode-select --install

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
fi

#Install Homebrew dependencies
brew bundle

#Link .rc files to their respective places
ln -sf "$(pwd)/.vimrc" $HOME/
ln -sf "$(pwd)/.zshrc" $HOME/

# Generate default ssh key
# ssh-keygen


## Setting system defaults ##

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

git submodule init && git submodule update

# Install Vundle Plugin Manager for Vim
if [[ ! -r ~/.vim/bundle/ ]]
then
	mkdir -p ~/.vim/bundle/
fi

ln -sf "$(pwd)/Vundle.vim" ~/.vim/bundle
vim +PluginInstall +qall

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
# rm -rf ~/Library/Application Support/Dock/desktoppicture.db
# sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
# sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

# Use scroll gesture with the Ctrl (^) modifier key to zoom
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Follow the keyboard focus while zoomed in
# defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Install shell integrations for iterm
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
it2setcolor preset "Solarized Dark"

# Prefer nvim from now on
alias vim=nvim
