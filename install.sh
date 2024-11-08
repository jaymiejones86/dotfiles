sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Run brewfile (To be updated)
brew install

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/bundle
ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua
ln -s ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/dotfiles/bundle ~/.bundle
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
ln -s ~/dotfiles/default-gems ~/.default-gems
ln -s ~/dotfiles/aerospace.toml ~/.aerospace.toml
take ~/.localsettings

# Setup SSH Git Signing
touch ~/.ssh/allowed_signers
echo "$(git config --get user.email) namespaces=\"git\" $(cat ~/.ssh/id_rsa.pub)" >> ~/.ssh/allowed_signers

# Install ASDF Plugins

asdf plugin-add pnpm
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
export PKG_CONFIG_PATH="/opt/homebrew/bin/pkg-config:$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix curl)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig"
asdf plugin-add postgres

# No longer need Plug at this point as kickstart.nvim handles this
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# nvim +PlugInstall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# OLD

# rcup -d dotfiles -x install.sh -x README.md -x VIM-PLUGINS.md -x Brewfile -x af-magic-mod.zsh-theme -x vimrc.d/* -x memegifs.sh -x Oceanic-Dark.itermcolors -x scripts/*
# mkdir -p ~/.config/nvim
# mkdir -p ~/.config/nvim/bundle
# mv ~/.nvimrc ~/.config/nvim/init.vim
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle
# nvim +PluginInstall +qall
