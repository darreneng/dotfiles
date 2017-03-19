#!/bin/bash

# Use this script to import all dotfiles into home directory

ln -siv $PWD/.vimrc ~
cp -riv $PWD/.vim/* ~/.vim
