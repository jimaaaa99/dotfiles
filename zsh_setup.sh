#!/bin/sh
mkdir -p ~/.zsh

curl -o ~/.zsh/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

cp .zshrc_template ~/
mv ~/.zshrc_template ~/.zshrc
