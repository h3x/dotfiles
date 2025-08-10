return {
  'CopilotC-Nvim/CopilotChat.nvim',

  dependencies = {
    {
      'zbirenbaum/copilot.lua',
     -- 'github/copilot.vim',
      url = 'git@github.com:zbirenbaum/copilot.lua.git',
      cmd = 'Copilot',
      event = 'InsertEnter',
      config = function()
        require('copilot').setup {
         github_token =os.getenv("GITHUB_TOKEN"),
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
      opts = {
                debug=true,
            },
    }, -- or github/copilot.vim
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  },
}
