-- Custom vim options and settings
-- These are extracted from init.lua to keep customizations separate from base config

-- Set encoding
vim.o.encoding = 'utf8'

-- Don't show vim startup message
vim.o.shortmess = "I"

-- Enable relative line numbers in addition to the standard line numbers
vim.wo.relativenumber = true

-- Ruby/RuboCop configuration (commented for reference)
-- This was commented in the original config
-- vim.g.vimrubocop_config = './rubocop.yml'