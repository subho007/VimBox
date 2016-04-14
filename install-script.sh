#!/usr/bin/env bash

git clone --recursive git@github.com:subho007/VimBox.git $HOME/.vimbox

PWD=$HOME/.vimbox

# first, backup any existing scripts if they are not symlinks
if [[ -d "$HOME/.vim" && ! -L "$HOME/.vim" ]]; then
  echo -e "moving ~/.vim to ~/.vim_backup"
  mv ~/.vim ~/.vim_backup
else
  echo "$HOME/.vim has already been moved, is a symlink, or does not exist"
fi

# .vimrc is a file, use the -f flag
if [[ -f "$HOME/.vimrc" && ! -L "$HOME/.vimrc" ]]; then
  echo -e "moving ~/.vimrc to ~/.vimrc_backup"
  mv ~/.vimrc ~/.vimrc_backup
else
  echo "$HOME/.vimrc has already been moved, is a symlink, or does not exist"
fi

# .gvimrc is a file, use the -f flag
if [[ -f "$HOME/.gvimrc" && ! -L "$HOME/.gvimrc" ]]; then
  echo -e "moving ~/.gvimrc to ~/.gvimrc_backup"
  mv ~/.gvimrc ~/.gvimrc_backup
else
  echo "$HOME/.gvimrc has already been moved, is a symlink, or does not exist"
fi

# now we can move all the new VimBox to our home directory
if [[ ! -d "$HOME/.vim" && ! -L "$HOME/.vim" ]]; then
  echo -e "Moving $PWD/dotVim to ~/.vim"
  ln -s "$PWD/dotVim" ~/.vim
else
  echo -e "$HOME/.vim was already moved, or already exists"
fi

if [[ ! -f "$HOME/.vimrc" && ! -L "$HOME/.vimrc" ]]; then
  echo -e "Moving $PWD/dotVimRc to ~/.vimrc"
  ln -s "$PWD/dotVimRc" ~/.vimrc
else
  echo -e "$HOME/.vimrc was already moved, or already exists"
fi

if [[ ! -f "$HOME/.gvimrc" && ! -L "$HOME/.gvimrc" ]]; then
  echo -e "Moving $PWD/dotGVimRc to ~/.gvimrc"
  ln -s "$PWD/dotGVimRc" ~/.gvimrc
else
  echo -e "$HOME/.gvimrc was already moved, or already exists"
fi

FONT_SOURCE="$PWD/dotVim/Fonts/InconsolataDz/Inconsolata-dz for Powerline.otf"
FONT_DEST="$HOME/Library/Fonts/Inconsolata-dz for Powerline.otf"

if [[ ! -f "$FONT_DEST" ]]; then
  echo -e "Installing font $FONT_SOURCE into $FONT_DEST"
  cp "$FONT_SOURCE" "$FONT_DEST"
else
  echo -e "The font was already installed"
fi
