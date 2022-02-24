call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Neovim Plugins
Plug 'neomake/neomake'

" General Plugins
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'thoughtbot/vim-rspec'
Plug 'skalnik/vim-vroom'
Plug 'bronson/vim-trailing-whitespace'
Plug 'epmatsw/ag.vim'
Plug 'vim-scripts/ctags.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'bling/vim-airline'
Plug 'sjl/strftimedammit.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'LnL7/vim-tslime'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-bundler.git'
Plug 'dockyard/vim-easydir'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/Rename2'
Plug 'tpope/vim-endwise'
Plug 'wesQ3/vim-windowswap'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-obsession'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-fugitive'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-git'
Plug 'jnwhiteh/vim-golang'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-markdown'
Plug 'sunaku/vim-ruby-minitest'
Plug 'mmalecki/vim-node.js'
Plug 'tpope/vim-rails'
Plug 'depuracao/vim-rdoc'
Plug 'vim-ruby/vim-ruby'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-jade'
Plug 'othree/html5.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

" Docker
Plug 'ekalinin/Dockerfile.vim'

" Elixir
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'telamon/vim-color-github'

" Themes
Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'name': 'dracula' }

" Initialize plugin system
call plug#end()
