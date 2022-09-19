local status_ok, mason = pcall(require, "mason")
if not status_ok then
	vim.notify("mason not found!!")
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  vim.notify("mason not found!!")
  return
end

local servers = {
  "sumneko_lua",
  "pyright",
  "tsserver",
  "rnix",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("lspconfig not found!!")
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "sumneko_lua" then
		local sumneko_opts = require("config.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end


  if server == "pyright" then
    local pyright_opts = require "config.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end
