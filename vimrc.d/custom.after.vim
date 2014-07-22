set noswapfile

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set rnu
set clipboard=unnamed
let &colorcolumn=join(range(81,999),",")
colorscheme solarized
set shell=/bin/sh
" set t_Co=256
" color grb256
" Sane Ignore For ctrlp
:map <leader>e :!bundle exec rspec %<cr>
let g:ctrlp_custom_ignore = { 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$', 'file': '\.exe$\|\.so$\|\.dat$' }
:nnoremap <CR> :nohlsearch<CR>/<BS>
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

au BufReadPost *.hamlc set syntax=haml

" Airline settings
" show statusbar all the time
set laststatus=2
" Add nice symbols with patched fonts from https://github.com/Lokaltog/powerline-fonts, im using 14,13pt source code pro medium
let g:airline_powerline_fonts = 1
" Set theme
let g:airline_theme="powerlineish"

" vim-rspec settings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set shortmess=I
