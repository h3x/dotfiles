local lsp = require('lsp-zero')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls'
})

local cmp = require('cmp')
local cmp_select = { behaviour = cmp.SelectBehaviour.Select }
local cmp_mappings = cmp.mapping.select_prev_item({
   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
   ['<C-Space>'] = cmp.mapping.complete(),
}) 

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

lsp.setup()
