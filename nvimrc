source ~/dotfiles/nvimrc.d/plugins.vim
source ~/dotfiles/nvimrc.d/theme.vim
source ~/dotfiles/nvimrc.d/general_settings.vim
source ~/dotfiles/nvimrc.d/extended_settings.vim
source ~/dotfiles/nvimrc.d/mappings.vim
source ~/dotfiles/nvimrc.d/file_types.vim
source ~/dotfiles/nvimrc.d/undotree.vim
source ~/dotfiles/nvimrc.d/vim_rspec.vim
source ~/dotfiles/nvimrc.d/syntax_settings.vim
source ~/dotfiles/nvimrc.d/devicons.vim
source ~/dotfiles/nvimrc.d/airline.vim
source ~/dotfiles/nvimrc.d/review.vim

lua <<EOF
 -- Need to switch to vim plug to allow installing extensions better
 -- require('telescope').load_extension('fzf')
EOF
