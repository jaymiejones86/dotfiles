rcup -d dotfiles -x install.sh -x README.md -x VIM-PLUGINS.md -x Brewfile -x af-magic-mod.zsh-theme -x vimrc.d/* -x memegifs.sh -x Oceanic-Dark.itermcolors
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/bundle
mv ~/.nvimrc ~/.config/nvim/init.vim
