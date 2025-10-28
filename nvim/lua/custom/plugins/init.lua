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

  -- Git Management
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  
  -- Themes
  { 
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1050,
  },
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
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1075,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1120
  },
  
  -- Markdown Support
  {
    "OXY2DEV/markview.nvim",
    event = "VeryLazy", -- Load after startup is complete
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },

  -- Amp CLI/IDE Support in Vim
  {
    "sourcegraph/amp.nvim",
    branch = "main", 
    lazy = false,
    opts = { auto_start = true, log_level = "info" },
  },
}

