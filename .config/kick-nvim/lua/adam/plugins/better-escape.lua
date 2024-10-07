-- return {
--   'max397574/better-escape.nvim',
--   config = function()
--     require('better_escape').setup {
--       mappings = {
--         k = {
--           j = '<Esc>',
--         },
--         j = {
--           k = '<Esc>',
--         },
--       }, -- a table with mappings to use
--       timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
--       clear_empty_lines = false, -- clear line after escaping if there is only whitespace
--       keys = '<Esc>', -- keys used for escaping, if it is a function will use the result everytime
--     }
--   end,
-- }

return {
  'max397574/better-escape.nvim',
  config = function()
    -- lua, default settings
    require('better_escape').setup {
      timeout = vim.o.timeoutlen,
      default_mappings = true,
      mappings = {
        i = {
          j = {
            k = '<Esc>',
            j = '<Esc>',
          },
          k = {
            j = '<Esc>',
          },
        },
        c = {
          j = {
            k = '<Esc>',
            j = '<Esc>',
          },
          k = {
            j = '<Esc>',
          },
        },
        t = {
          j = {
            k = '<C-\\><C-n>',
          },
          k = {
            j = '<C-\\><C-n>',
          },
        },
        v = {
          j = {
            k = '<Esc>',
          },
          k = {
            j = '<Esc>',
          },
        },
        s = {
          j = {
            k = '<Esc>',
          },
          k = {
            j = '<Esc>',
          },
        },
      },
    }
  end,
}
