-- Custom vim options and settings
-- These are extracted from init.lua to keep customizations separate from base config

-- Set encoding
vim.o.encoding = 'utf8'

-- Don't show vim startup message
vim.o.shortmess = "I"

-- Enable relative line numbers in addition to the standard line numbers
vim.wo.relativenumber = true

-- Show vertical guides for preferred maximum line lengths
vim.o.colorcolumn = '80,100'

-- Avoid a Neovim/Treesitter runtime error when opening larger Markdown files.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function(args)
    pcall(vim.treesitter.stop, args.buf)
  end,
})

-- Ruby/RuboCop configuration (commented for reference)
-- This was commented in the original config
-- vim.g.vimrubocop_config = './rubocop.yml'
