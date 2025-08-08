-- Custom keymaps and commands
-- These are extracted from init.lua to keep customizations separate from base config

-- File Management Keymaps
-- NERDTree toggle
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- File editing shortcuts - create new files relative to current buffer directory
vim.keymap.set('n', '<leader>ew', ":e <C-R>=expand('%:h').'/'<cr>", { desc = '[ew] edit new file from current buffer directory' })
vim.keymap.set('n', '<leader>es', ":sp <C-R>=expand('%:h').'/'<cr>", { desc = '[es] edit new file as horizontal split from current buffer directory' })
vim.keymap.set('n', '<leader>ev', ":vsp <C-R>=expand('%:h').'/'<cr>", { desc = '[ev] edit new file as vertical split from current buffer directory' })
vim.keymap.set('n', '<leader>et', ":tabe <C-R>=expand('%:h').'/'<cr>", { desc = '[et] edit new file in a tab from current buffer directory' })

-- Editor Navigation Keymaps
-- Disable highlight search when using enter key
vim.keymap.set('n', '<CR>', ":nohlsearch<CR>/<BS>", { desc = '[CR] turn off highlight search' })

-- Zoom a vim pane, <C-w>= to re-balance
vim.keymap.set('n', '<leader>=', ":wincmd =<cr>", { desc = '[=] balance vim pane' })

-- RSpec Testing Keymaps (Ruby Development)
-- NOTE: Fixed duplicate keymap issue - using different keys for different functions
vim.keymap.set('n', '<leader>rf', ":call RunCurrentSpecFile()<CR>", { desc = '[rf] RSpec run current spec file' })
vim.keymap.set('n', '<leader>rs', ":call RunNearestSpec()<CR>", { desc = '[rs] RSpec run nearest spec' })
vim.keymap.set('n', '<leader>rl', ":call RunLastSpec()<CR>", { desc = '[rl] RSpec run last spec' })
vim.keymap.set('n', '<leader>ra', ":call RunAllSpecs()<CR>", { desc = '[ra] RSpec run all specs' })

-- Custom Commands
-- Copy current file path to clipboard
vim.api.nvim_create_user_command('CopyFilePath', function()
  local filepath = vim.fn.expand('%:p')
  vim.fn.setreg('+', filepath)
  vim.notify('Copied file path to clipboard:\n' .. filepath, vim.log.levels.INFO)
end, { desc = 'Copy current file path to clipboard' })