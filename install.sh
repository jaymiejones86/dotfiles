sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Run brewfile (To be updated)

brew install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/bundle
ln -s ~/dotfiles/bundle ~/.bundle
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/alacritty.yml ~/.alacritty.yml
ln -s ~/dotfiles/fzf.zsh ~/.fzf.zsh
ln -s ~/dotfiles/gemrc ~/.gemrc
ln -s ~/dotfiles/gitattributes ~/.gitattributes
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/gitmessage ~/.gitmessage
ln -s ~/dotfiles/profile ~/.profile
ln -s ~/dotfiles/psqlrc ~/.psqlrc
ln -s ~/dotfiles/railsrc ~/.railsrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zlogin ~/.zlogin
ln -s ~/dotfiles/zshenv ~/.zshenv
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/gnupg ~/.gnupg

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# OLD

# rcup -d dotfiles -x install.sh -x README.md -x VIM-PLUGINS.md -x Brewfile -x af-magic-mod.zsh-theme -x vimrc.d/* -x memegifs.sh -x Oceanic-Dark.itermcolors -x scripts/*
# mkdir -p ~/.config/nvim
# mkdir -p ~/.config/nvim/bundle
# mv ~/.nvimrc ~/.config/nvim/init.vim
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle
# nvim +PluginInstall +qall
