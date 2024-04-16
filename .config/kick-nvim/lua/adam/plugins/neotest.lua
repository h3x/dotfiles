return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Adaptors
    'nvim-neotest/neotest-python',
  },
  opts = {
    adapters = {
      ['neotest-python'] = {
        -- Here you can specify the settings for the adapter, i.e.
        runner = 'pytest',
        -- python = ".venv/bin/python",
      },
    },
  },
}
