" General
filetype off                  " required

let mapleader = ","

set shell=/bin/sh
set noswapfile

set rnu
set clipboard=unnamed

set shortmess=I

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8

" Plugin Settings
let g:ctrlp_custom_ignore = { 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|node_modules\|log\|tmp$', 'file': '\.exe$\|\.so$\|\.dat$' }
let g:rspec_command = ":split | term ./bin/rspec {spec}"

" NeoMake
autocmd! BufWritePost * Neomake

" Alchemist Plugin
let g:alchemist_tag_disable = 1

" Rubocop Config Lookup
let g:vimrubocop_config = './rubocop.yml'
