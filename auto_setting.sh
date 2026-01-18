#! /bin/bash

## Linux
## install something indeed
sudo apt-get update
sudo apt-get install build-essential cmake -y
sudo apt-get install python-dev
sudo apt-get install ctags -y
sudo apt-get install ack-grep -y

sudo apt-get install tmux -y
sudo pip install powerline-status

go get -u github.com/jstemmer/gotags

cd ~/vim-bash-tmux/.vim/bundle/YouCompleteMe/
./install.py --clang-completer
./install.py --go-completer

## Mac OSX
## install pyenv and wrapvirtual
brew install pyenv 
pyenv install -v 3.8.12
pyenv global 3.8.12
pip install virtualenv virtualenvwrapper

## install k8s management tool
brew install kubecm k9s

# ## install 

# install zsh plugin confluence from: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
git clone --depth=1 --branch master git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone --branch master https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
brew install autojump


ln -s ~/vim-bash-tmux/.tmux.conf ~/.tmux.conf
ln -s ~/vim-bash-tmux/.vimrc  ~/.vimrc
ln -s ~/vim-bash-tmux/.vim ~/.vim
ln -s ~/vim-bash-tmux/.tmux ~/.tmux
rm -rf ~/.bashrc
ln -s ~/vim-bash-tmux/.bashrc ~/.bashrc
rm -rf ~/.zshrc
ln -s ~/vim-bash-tmux/.zshrc ~/.zshrc
