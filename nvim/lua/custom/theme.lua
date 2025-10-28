-- Custom theme and colorscheme configurations
-- These are extracted from init.lua to keep customizations separate from base config

-- Theme Configuration
-- Set your preferred theme here by uncommenting the desired option

-- Option 1: Night Owl Theme
-- vim.cmd.colorscheme 'night-owl'

-- Option 2: Catppuccin Theme (currently active)
vim.cmd.colorscheme 'tokyonight'

-- Option 3: Dracula Theme
-- vim.cmd.colorscheme 'dracula'

-- Option 4: OneDark Theme (now available via custom plugins)
-- vim.cmd.colorscheme 'onedark'

-- Custom Lualine Theme Configuration
-- Note: This should match your chosen colorscheme or be customized as desired
-- The lualine configuration is in the plugins section, but the theme can be customized here

-- Function to easily switch themes (optional utility)
local function set_theme(theme_name)
  vim.cmd.colorscheme(theme_name)
  print("Theme switched to: " .. theme_name)
end

-- Create user commands for easy theme switching
vim.api.nvim_create_user_command('ThemeNightOwl', function()
  set_theme('night-owl')
end, { desc = 'Switch to Night Owl theme' })

vim.api.nvim_create_user_command('ThemeCatppuccin', function()
  set_theme('catppuccin')
end, { desc = 'Switch to Catppuccin theme' })

vim.api.nvim_create_user_command('ThemeDracula', function()
  set_theme('dracula')
end, { desc = 'Switch to Dracula theme' })

vim.api.nvim_create_user_command('ThemeOneDark', function()
  set_theme('onedark')
end, { desc = 'Switch to OneDark theme' })

vim.api.nvim_create_user_command('ThemeTokyoNight', function()
  set_theme('tokyonight')
end, { desc = 'Switch to TokyoNight theme' })

vim.api.nvim_create_user_command('ThemeKangawa', function()
  set_theme('kanagawa')
end, { desc = 'Switch to Kangawa theme' })

vim.api.nvim_create_user_command('ThemeDuskfox', function()
  set_theme('duskfox')
end, { desc = 'Switch to Duskfox theme' })
