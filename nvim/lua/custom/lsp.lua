-- Custom LSP configurations
-- These are extracted from init.lua to keep customizations separate from base config

local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok_cmp then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local function on_attach(client, bufnr)
  if client.name == 'ruby_lsp' then
    client.server_capabilities.semanticTokensProvider = nil
  end

  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local function setup(server_name, config)
  if not lspconfig[server_name] then
    return
  end

  -- mason-lspconfig can auto-enable servers before this custom setup runs.
  -- Disable that default client so only the explicit custom config attaches.
  if vim.lsp.enable then
    pcall(vim.lsp.enable, server_name, false)
  end

  lspconfig[server_name].setup(vim.tbl_deep_extend('force', {
    capabilities = capabilities,
    on_attach = on_attach,
  }, config or {}))
end

local function ignore_ruby_lsp_rails_init_warning(err, result, ctx, config)
  if result and result.message and result.message:find('Ruby LSP Rails extension needs to be initialized', 1, true) then
    return
  end

  return vim.lsp.handlers[ctx.method](err, result, ctx, config)
end

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  cssls = {},
  html = {},
  jsonls = {},
}

local function mason_package_executable(package_name, executable_name)
  local ok_registry, registry = pcall(require, 'mason-registry')
  if not ok_registry then
    return nil
  end

  local ok_package, package = pcall(registry.get_package, package_name)
  if not ok_package or not package:is_installed() then
    return nil
  end

  local ok_location, install_location = pcall(require, 'mason-core.installer.InstallLocation')
  if not ok_location then
    return nil
  end

  local executable = install_location.global():package(package.name) .. '/' .. executable_name
  if vim.fn.executable(executable) == 1 then
    return executable
  end

  return nil
end

local elixir_ls_cmd = mason_package_executable('elixir-ls', 'language_server.sh')
if elixir_ls_cmd then
  servers.elixirls = {
    cmd = { elixir_ls_cmd },
    settings = {
      elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false,
      },
    },
  }
end

local ruby_lsp_cmd = mason_package_executable('ruby-lsp', 'bin/ruby-lsp')
if not ruby_lsp_cmd and vim.fn.executable('ruby-lsp') == 1 then
  ruby_lsp_cmd = 'ruby-lsp'
end

-- Prefer the current Ruby LSP, but only configure servers with available commands.
if lspconfig.ruby_lsp and ruby_lsp_cmd then
  servers.ruby_lsp = {
    cmd = { ruby_lsp_cmd },
    init_options = {
      formatter = 'auto',
      enabledFeatures = {
        semanticHighlighting = false,
      },
    },
    handlers = {
      ['window/logMessage'] = ignore_ruby_lsp_rails_init_warning,
      ['window/showMessage'] = ignore_ruby_lsp_rails_init_warning,
    },
  }
elseif vim.fn.executable('solargraph') == 1 then
  servers.solargraph = {
    cmd = { 'solargraph', 'stdio' },
  }
end

if lspconfig.ts_ls then
  servers.ts_ls = {}
elseif lspconfig.tsserver then
  servers.tsserver = {}
end

local ok_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
if ok_mason_lspconfig then
  local ensure_installed = {}
  for server_name, _ in pairs(servers) do
    table.insert(ensure_installed, server_name)
  end
  if not servers.elixirls then
    table.insert(ensure_installed, 'elixirls')
  end
  if lspconfig.ruby_lsp and not servers.ruby_lsp then
    table.insert(ensure_installed, 'ruby_lsp')
  end

  mason_lspconfig.setup {
    ensure_installed = ensure_installed,
  }
end

for server_name, config in pairs(servers) do
  setup(server_name, config)
end

-- Additional custom LSP configurations can be added here
-- Example structure for adding more language servers:
--
-- require('lspconfig').your_language_server.setup {
--   -- your configuration here
-- }
