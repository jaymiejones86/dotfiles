" undotree plugin mapping
nnoremap <F5> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
