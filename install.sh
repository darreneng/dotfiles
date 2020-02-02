#!/bin/bash

# Use this script to import all dotfiles into home directory

ln -siv $PWD/.vimrc ~
ln -siv $PWD/.zshrc ~
cp -riv $PWD/.vim/ ~/.vim
