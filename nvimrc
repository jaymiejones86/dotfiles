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
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  }
  require('telescope').load_extension('fzf')
EOF
