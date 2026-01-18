#! /bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# link

ln -s `pwd`/.vimrc $HOME/.vimrc
ln -s `pwd`/.zshrc $HOME/.zshrc
ln -s `pwd`/.tmux.conf $HOME/.tmux.conf
ln -s `pwd`/.vim/colors $HOME/.vim/colors
ln -s `pwd`/.asdfrc $HOME/.asdfrc
