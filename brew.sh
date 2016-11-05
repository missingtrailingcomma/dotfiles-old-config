#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# js stuff
brew install node
brew install flow
brew install phantomjs

# download util
# Install `wget` with IRI support.
brew install wget --with-iri
brew install youtube-dl

# other util
brew install imagemagick
brew install tor
brew install tree
brew install lynx

## gui
brew cask install vlc
brew cask install fugu
brew cask install imageoptim
brew cask install google-chrome-canary
brew cask install spectacle

## quicklook
brew cask install qlstephen
brew cask install qlcolorcode
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install betterzipql

# Remove outdated versions from the cellar.
brew cleanup
