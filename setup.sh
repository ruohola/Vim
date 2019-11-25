#!/usr/bin/env bash


# make the needed symlinks if they don't exist
cd ~  # makes sure that the symlinks are shown as relative to ~ with ls -la

if [ ! -L .vim ]; then
    rm -rf .vim
    ln -sv dotfiles/vim .vim
fi

if [ ! -L .ideavimrc ]; then
    ln -sfv dotfiles/vim/.ideavimrc .ideavimrc
fi

for file in dotfiles/bash/.[^.]*; do
    file=$(basename "$file")
    if [ ! -L "$file" ] && [ "$file" != '.DS_Store' ]; then
        ln -sfv dotfiles/bash/"$file" "$file"
    fi
done

for file in dotfiles/git/.[^.]*; do
    file=$(basename "$file")
    if [ ! -L "$file" ] && [ "$file" != '.DS_Store' ]; then
        ln -sfv dotfiles/git/"$file" "$file"
    fi
done

# on purpose as absolute links and not relative to ~
for file in dotfiles/keylayouts/*.keylayout; do
    file=$(basename "$file")
    if [ ! -L /Library/Keyboard\ Layouts/"$file" ]; then
        sudo ln -sfv ~/dotfiles/keylayouts/"$file" /Library/Keyboard\ Layouts/"$file"
    fi
done

if [ ! -L .config/karabiner ]; then
    rm -rf .config/karabiner
    ln -sv ~/dotfiles/karabiner ~/.config/karabiner
fi

if [ ! -L .config/ranger ]; then
    rm -rf .config/ranger
    ln -sv ~/dotfiles/ranger ~/.config/ranger
fi


# install all vim plugins (cannot be done in background with &)
vim -c "PlugClean!" -c "PlugInstall" -c "qa!"


# install homebrew-bundle and all brew packages with it
brew tap homebrew/bundle
brew bundle --file=~/dotfiles/brew/Brewfile

# install fzf shell extensions
/usr/local/opt/fzf/install
