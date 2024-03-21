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

-- Not and autocommand but ill stick it here for now.
-- Redirect a lua command output to a new buffer
-- eg :Redir lua=print(vim.inspect(vim.lsp.buf_get_clients()))
vim.api.nvim_create_user_command('Redir', function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
  vim.cmd 'new'
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })
