#! /bin/bash

# Clone necessary repositories
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "Vundle.vim already exists, skipping clone."
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "tmux plugin manager already exists, skipping clone."
fi

[[ ! -d ~/.vim/colors ]] && mkdir -p ~/.vim/colors

# Create symbolic links
for file in .vimrc .zshrc .tmux.conf .asdfrc .bashrc .vim/colors/monokai.vim; do
  if [ -f "$(pwd)/$file" ]; then
    ln -sf "$(pwd)/$file" "$HOME/$file"
    echo "Linked $file to $HOME/$file"
  else
    echo "Source file $(pwd)/$file does not exist, skipping."
  fi
done

# Handle nested directory for opencode skill
if [ -d "$(pwd)/.config/opencode/skill" ]; then
  mkdir -p "$HOME/.config/opencode"
  ln -sf "$(pwd)/.config/opencode/skill" "$HOME/.config/opencode/skill"
  echo "Linked skill directory to $HOME/.config/opencode/skill"
else
  echo "Source directory $(pwd)/.config/opencode/skill does not exist, skipping."
fi