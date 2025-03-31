return {
  'max397574/better-escape.nvim',
  config = function()
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
