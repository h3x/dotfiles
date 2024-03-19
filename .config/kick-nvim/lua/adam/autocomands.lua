--[[ Basic Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- TODO: Make this work
-- vim.api.nvim_create_autocmd('InsertLeave', {
--   desc = 'Automativaly save file when leaving insert mode',
--   group = vim.api.nvim_create_augroup('kickstart-autosave', { clear = true }),
--   callback = function()
--     vim.cmd('silent! write')
--   end,
-- })
