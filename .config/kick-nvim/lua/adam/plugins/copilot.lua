return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'canary',
  dependencies = {
    {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      event = 'InsertEnter',
      config = function()
        require('copilot').setup {
          panel = {
            enabled = true,
            auto_refresh = true,
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
              accept = '<C-y>',
              accept_word = false,
              accept_line = false,
              next = '<C-n>',
              prev = '<C-p>',
              dismiss = '<C-k>',
            },
          },
        }
      end,
    }, -- or github/copilot.vim
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  },
  opts = {
    debug = true, -- Enable debugging
  },
}
