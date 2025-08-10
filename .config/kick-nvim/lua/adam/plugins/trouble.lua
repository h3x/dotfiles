return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('trouble').setup()

    local actions = require 'telescope.actions'
    local trouble = require 'trouble.sources.telescope'

    local telescope = require 'telescope'

    telescope.setup {
      defaults = {
        mappings = {
          i = { ['<leader>ft'] = trouble.open },
          n = { ['<leader>ft'] = trouble.open },
        },
      },
    }
  end,
}
