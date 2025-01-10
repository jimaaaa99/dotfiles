#!/bin/sh
CURRENT_PATH=$(pwd)

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.vim/colors/solarized.vim --create-dirs \
  https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
curl -fLo ~/.config/nvim/colors/solarized.vim --create-dirs \
  https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
cp NeoSolarized.vim ~/.config/nvim/colors/

ln -sf "$CURRENT_PATH/.vimrc" $HOME/.vimrc
ln -sf "$CURRENT_PATH/init.vim" $HOME/.config/nvim/init.vim
ln -sf "$CURRENT_PATH/.tmux.conf" $HOME/.tmux.conf
ln -sf "$CURRENT_PATH/.gitignore_global" $HOME/.gitignore_global
ln -sf "$CURRENT_PATH/.vimrc" $HOME/.config/nvim/init.vim

TARGET_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d $TARGET_DIR ]; then
  git clone https://github.com/tmux-plugins/tpm $TARGET_DIR
fi

mkdir ~/.zsh
cd ~/.zsh
