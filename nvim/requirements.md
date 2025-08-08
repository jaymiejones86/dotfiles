# NeoVim Configuration Requirements

This document outlines all custom modifications made to the Kickstart.nvim base configuration to ensure they are preserved during upgrades.

## Custom Plugins Added

### Core Editor Plugins
- `dockyard/vim-easydir` - Automatically create directories when editing files
- `editorconfig/editorconfig-vim` - EditorConfig support
- `preservim/nerdtree` - File tree explorer
- `ryanoasis/vim-devicons` - File icons for NERDTree
- `tpope/vim-surround` - Surrounding text manipulation
- `nathanaelkane/vim-indent-guides` - Visual indent guides
- `ap/vim-css-color` - CSS color highlighting
- `mattn/emmet-vim` - HTML/CSS expansion shortcuts
- `tpope/vim-obsession` - Session management
- `wuelnerdotexe/vim-astro` - Astro framework support
- `mg979/vim-visual-multi` - Multiple cursors
- `kdheepak/lazygit.nvim` - LazyGit integration
- `mbbill/undotree` - Undo tree visualization

### Ruby Development
- `thoughtbot/vim-rspec` - RSpec test runner integration

### Markdown Support
- `OXY2DEV/markview.nvim` - Enhanced markdown viewing

### Utility Plugins
- `sjl/strftimedammit.vim` - Time formatting utilities

## Custom Themes

### Primary Themes
- `oxfist/night-owl.nvim` - Night Owl theme (currently active)
- `catppuccin/nvim` - Catppuccin theme (configured but not active)

### Commented Out (Previously Used)
- `navarasu/onedark.nvim` - OneDark theme

## Custom Vim Options

### Display Settings
- `vim.o.encoding = 'utf8'` - UTF-8 encoding
- `vim.o.shortmess = "I"` - Hide vim startup message
- `vim.wo.relativenumber = true` - Relative line numbers

### Commented Configuration
- `let g:vimrubocop_config = './rubocop.yml'` - RuboCop configuration path

## Custom Keymaps

### File Management
- `<leader>n` - Toggle NERDTree
- `<leader>ew` - Edit new file from current buffer directory
- `<leader>es` - Edit new file as horizontal split
- `<leader>ev` - Edit new file as vertical split  
- `<leader>et` - Edit new file in new tab

### Editor Navigation
- `<CR>` - Turn off highlight search
- `<leader>=` - Balance vim panes

### RSpec Testing (Ruby)
- `<leader>t` - Run current spec file (NOTE: Duplicate keymap exists)
- `<leader>s` - Run nearest spec
- `<leader>l` - Run last spec
- `<leader>t` - Run all specs (NOTE: This overwrites the first <leader>t mapping)

## Custom Commands

### Utility Commands
- `:CopyFilePath` - Copy current file path to system clipboard

## Custom LSP Configuration

### Language Servers
- **Solargraph** - Ruby language server
  ```lua
  require('lspconfig').solargraph.setup {
    cmd = { "solargraph", "stdio" }
  }
  ```

## Custom Treesitter Languages

### Additional Languages Added
- `ruby` - Ruby syntax highlighting
- `javascript` - JavaScript syntax highlighting  
- `css` - CSS syntax highlighting

**Note:** These are added directly to the main `init.lua` treesitter configuration with clear comments identifying them as custom additions. This approach avoids the complexity of merging treesitter configs from multiple files.

## Issues to Fix During Refactoring

### Duplicate Keymaps
- Line 575 overwrites line 572 for `<leader>t` mapping
- Need to resolve which RSpec function should use `<leader>t`

### Commented Code
- Mason LSP setup handlers (lines 503-511) are commented out
- May cause LSP functionality issues
- Need to verify if this was intentional

### Theme Configuration
- Multiple themes configured but only one can be active
- Consider making theme selection more dynamic

## File Organization Structure

### Custom Module Structure
```
nvim/
├── init.lua (clean base config)
└── lua/
    └── custom/
        ├── options.lua (vim options)
        ├── keymaps.lua (keymaps & commands)
        ├── lsp.lua (LSP configurations)
        ├── theme.lua (theme setup)
        └── plugins/
            └── init.lua (plugin definitions)
```

## Upgrade Strategy

1. Keep `init.lua` as close to upstream Kickstart.nvim as possible
2. Import all customizations from `lua/custom/` modules
3. Document any deviations from standard Kickstart.nvim patterns
4. Test all functionality after any upstream updates

## Dependencies

### External Tools Required
- `solargraph` gem for Ruby LSP support
- `make` for telescope-fzf-native compilation
- Git for LazyGit integration

### Optional Dependencies
- RuboCop for Ruby linting (referenced in comments)
- Node.js/npm for some language servers