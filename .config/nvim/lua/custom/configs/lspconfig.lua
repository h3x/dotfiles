local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "python" },
})

lspconfig.elixirls.setup({
  cmd = { "elixir-ls" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "elixir", "eelixir", "heex", "surface" },
})

-- lspconfig.volar.setup{
--   filetypes = { 'javascript', 'vue', 'json'}
-- }

lspconfig.vls.setup({
  cmd = { "vls" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "vue" },
})


