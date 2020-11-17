#!/bin/sh

brew update
brew upgrade

# Install GNU core utilities
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim 
brew install grep
brew install openssh
brew install tmux

brew install xz

# Install other useful binaries.
brew install git
brew install git-lfs
brew install gs
brew install htop
brew cask install iterm2
brew install imagemagick
brew install p7zip
brew install pigz
brew install pv

# Remove outdated versions from the cellar.
brew cleanup

