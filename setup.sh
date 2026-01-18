#! /bin/bash

# Clone necessary repositories
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create symbolic links
ln -sf `pwd`/.vimrc $HOME/.vimrc
ln -sf `pwd`/.zshrc $HOME/.zshrc
ln -sf `pwd`/.tmux.conf $HOME/.tmux.conf
ln -sf `pwd`/.asdfrc $HOME/.asdfrc
ln -sf `pwd`/.bashrc $HOME/.bashrc
ln -sf `pwd`/.config/opencode/skill $HOME/.config/opencode/skill
