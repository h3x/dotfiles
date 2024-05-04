return {
  'S1M0N38/love2d.nvim',
  cmd = 'LoveRun',
  opts = {
    path_to_love_bin = '/opt/love.app/Contents/MacOS/love',
    path_to_love_library = vim.fn.globpath(vim.o.runtimepath, 'love2d/library'),
    restart_on_save = false,
  },
  keys = {
    { '<leader>v', desc = 'LÖVE' },
    { '<leader>vv', '<cmd>LoveRun<cr>', desc = 'Run LÖVE' },
    { '<leader>vs', '<cmd>LoveStop<cr>', desc = 'Stop LÖVE' },
  },
}
