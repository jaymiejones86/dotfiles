set nocompatible              " be iMproved, required
filetype off                  " required

let g:rspec_command = "!clear && bundle exec rspec {spec}"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" General Plugins
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-unimpaired'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'thoughtbot/vim-rspec'
Plugin 'skalnik/vim-vroom'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'epmatsw/ag.vim'
Plugin 'vim-scripts/ctags.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'bling/vim-airline'
Plugin 'sjl/strftimedammit.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'LnL7/vim-tslime'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-commentary'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-bundler.git'
Plugin 'dockyard/vim-easydir'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/Rename2'
Plugin 'tpope/vim-endwise'
Plugin 'wesQ3/vim-windowswap'

" Languages
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-git'
Plugin 'jnwhiteh/vim-golang'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-markdown'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'mmalecki/vim-node.js'
Plugin 'tpope/vim-rails'
Plugin 'depuracao/vim-rdoc'
Plugin 'vim-ruby/vim-ruby'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'othree/html5.vim'
Plugin 'mustache/vim-mustache-handlebars'

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'telamon/vim-color-github'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Import Settings
source ~/dotfiles/vimrc.d/custom.before.vim
source ~/dotfiles/vimrc.d/gui_settings.vim
source ~/dotfiles/vimrc.d/statusline.vim
source ~/dotfiles/vimrc.d/filetypes.vim
source ~/dotfiles/vimrc.d/mappings.vim
source ~/dotfiles/vimrc.d/settings.vim
source ~/dotfiles/vimrc.d/custom.after.vim
