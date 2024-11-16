-- return {
--   'nvim-neotest/neotest',
--   dependencies = {
--     'nvim-treesitter/nvim-treesitter',
--     'nvim-neotest/nvim-nio',
--     'nvim-lua/plenary.nvim',
--     'antoinemadec/FixCursorHold.nvim',
--     'nvim-treesitter/nvim-treesitter',
--     -- Adaptors
--     'nvim-neotest/neotest-python',
--   },
--   config = function()
--     require('neotest').setup {
--       log_level = vim.log.levels.DEBUG,
--       adapters = {
--         require 'neotest-python' {
--           log_level = vim.log.levels.DEBUG,
--           dap = { justMyCode = false },
--           runner = 'pytest',
--           args = function()
--             return {
--               '--rootdir',
--               '/home/developer1/alayadev/accloud-lde/services/api.accounting/backend/api.accounting',
--             }
--           end,
--           command = function()
--             return '~/alayadev/accloud-lde/services/api.accounting/scripts/run-tests.sh > ~/tmp/neotest.log'
--           end,
--         },
--       },
--     }
--   end,
-- }

-- return {
--   'nvim-neotest/neotest',
--   dependencies = {
--     'nvim-treesitter/nvim-treesitter',
--     'nvim-neotest/nvim-nio',
--     'nvim-lua/plenary.nvim',
--     'antoinemadec/FixCursorHold.nvim',
--     'nvim-treesitter/nvim-treesitter',
--     -- Adaptors
--     'nvim-neotest/neotest-python',
--   },
--   config = function()
--     require('neotest').setup {
--       log_level = vim.log.levels.DEBUG,
--       adapters = {
--         require 'neotest-python' {
--           dap = { justMyCode = false },
--           runner = 'pytest',
--           args = function()
--             return {
--               '--rootdir',
--               '/home/developer1/alayadev/accloud-lde/services/api.accounting/backend/api.accounting',
--             }
--           end,
--           command = function()
--             return {
--               'docker compose exec apiaccounting python -m pytest',
--             }
--           end,
--         },
--       },
--     }
--   end,
-- }

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
  config = function()
    require('neotest').setup {
      log_level = vim.log.levels.DEBUG,
      adapters = {
        require 'neotest-python' {
          dap = { justMyCode = false },
          runner = 'pytest',
          args = function()
            return {
              '--rootdir',
              '/home/developer1/alayadev/accloud-lde/services/api.accounting/backend/api.accounting',
            }
          end,
          command = function()
            return {
              'docker compose exec apiaccounting python -m pytest',
            }
          end,
        },
      },
    }
  end,
  opts = {
    adapters = {
      ['neotest-python'] = {
        dap = { justMyCode = false },
        runner = 'pytest',
        args = function()
          return {
            '--rootdir',
            '/home/developer1/alayadev/accloud-lde/services/api.accounting/backend/api.accounting',
          }
        end,
        command = function()
          return {
            'docker compose exec apiaccounting python -m pytest',
          }
        end,
      },
    },
  },
}
