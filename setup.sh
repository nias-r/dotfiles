#! /usr/bin/env bash

# antigen
curl -L git.io/antigen > ~/.antigen.zsh

# Vundle
[[ -d ~/.vim/bundle/Vundle.vim ]] || git clone git@github.com:/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# tmux
[[ -d ~/.tmux ]] || git clone git@github.com:gpakosz/.tmux.git ~/.tmux
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf

# link
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf.local ~/.tmux.conf.local

# version managers
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
curl -L https://get.rvm.io | bash -s stable

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# alacritty
brew cask install alacritty
