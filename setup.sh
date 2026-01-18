#! /bin/bash

# Clone necessary repositories
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Install Vim plugins
  vim +PlugInstall +qall
else
  echo "plug.vim already exists, skipping clone."
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # Install tmux plugins
  ~/.tmux/plugins/tpm/bin/install_plugins
else
  echo "tmux plugin manager already exists, skipping clone."
fi

[[ ! -d ~/.vim/colors ]] && mkdir -p ~/.vim/colors

# Create symbolic links
for file in .vimrc .zshrc .tmux.conf .asdfrc .kubectl_aliases .vim/colors/monokai.vim; do
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
