-- Custom plugins configuration
-- All custom plugins are defined here to keep them separate from base config
-- See the kickstart.nvim README for more information

return {
  -- File Management
  "preservim/nerdtree",
  "ryanoasis/vim-devicons",
  "dockyard/vim-easydir", -- Automatically create directories when editing files
  
  -- Editor Configuration
  "editorconfig/editorconfig-vim", -- EditorConfig support
  
  -- Text Manipulation
  "tpope/vim-surround",
  "nathanaelkane/vim-indent-guides",
  "mg979/vim-visual-multi", -- Multiple cursors
  
  -- Ruby Development
  "thoughtbot/vim-rspec",
  
  -- Web Development
  "ap/vim-css-color", -- CSS color highlighting
  "mattn/emmet-vim", -- HTML/CSS expansion shortcuts
  "wuelnerdotexe/vim-astro", -- Astro framework support
  
  -- Utility Plugins
  "sjl/strftimedammit.vim", -- Time formatting utilities
  "tpope/vim-obsession", -- Session management
  "mbbill/undotree", -- Undo tree visualization
  "kdheepak/lazygit.nvim", -- LazyGit integration
  
  -- Themes
  { 
    "oxfist/night-owl.nvim",
    lazy = false,
    priority = 1050,
  },
  { 
    "catppuccin/nvim",
    lazy = false,
    priority = 1100,
  },
  
  -- Markdown Support
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
}

