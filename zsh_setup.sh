#!/bin/sh
mkdir -p ~/.zsh

curl -o ~/.zsh/git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
git clone --depth=1 https://github.com/woefe/git-prompt.zsh ~/.zsh/git-prompt.zsh

cp .zshrc_template ~/
mv ~/.zshrc_template ~/.zshrc
