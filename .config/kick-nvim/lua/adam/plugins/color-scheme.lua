function ColorMyPencils(color)
  color = color or 'catppuccin'
  vim.cmd.colorscheme(color)

  --   vim.cmd.hi 'Comment gui=none'
  -- vim.api.nvim_set_hl(0, 'Comment', { gui = 'none' })
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  require('notify').setup {
    background_colour = '#000000',
  }
end

return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    -- init = function()
    --   vim.cmd.colorscheme 'tokyonight-night'

    -- You can configure highlights by doing something like
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme 'catppuccin-mocha'

    -- You can configure highlights by doing something like
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {}
    end,

    -- optionally set the colorscheme within lazy config
    -- init = function()
    --   vim.cmd 'colorscheme poimandres'
    -- end,
  },
  {
    'eldritch-theme/eldritch.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      ColorMyPencils 'catppuccin-mocha'
      -- vim.cmd 'colorscheme eldritch'
      -- }
    end,
  },
}
