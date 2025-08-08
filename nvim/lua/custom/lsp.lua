-- Custom LSP configurations
-- These are extracted from init.lua to keep customizations separate from base config

-- Ruby LSP configuration using Solargraph
-- Solargraph is a Ruby language server that provides IntelliSense, code completion, and diagnostics
require('lspconfig').solargraph.setup {
  cmd = { "solargraph", "stdio" }
}

-- Additional custom LSP configurations can be added here
-- Example structure for adding more language servers:
--
-- require('lspconfig').your_language_server.setup {
--   -- your configuration here
-- }