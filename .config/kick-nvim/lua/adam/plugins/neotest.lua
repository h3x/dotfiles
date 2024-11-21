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
    'haydenmeade/neotest-jest',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'npm test --', -- Adjust based on your setup
          jestConfigFile = 'jest.config.js', -- Path to your Jest config file
          env = { CI = true }, -- Example environment variables
        },
        require 'neotest-python' {
          log_level = vim.log.levels.DEBUG,
          cwd = '/data', -- Inside the container
          root_dir = function()
            return '/data' -- Inside the container
          end,
          command = function()
            -- return 'docker compose exec apiaccounting pytest'
            return "docker compose exec apiaccounting /bin/bash -c 'source /data/venv/bin/activate && pytest $@'"
          end,
          args = function(file)
            -- Map local file paths to container paths
            local mappings = {
              ['/home/developer1/alayadev/accloud-lde/services/api.accounting/backend/api.accounting'] = '/data',
            }
            for local_path, docker_path in pairs(mappings) do
              if file:find(local_path, 1, true) then
                return { file:gsub(local_path, docker_path) }
              end
            end
            return { file }
          end,
        },
      },
    }
  end,
}

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
--       adapters = {
--         require 'neotest-python' {
--           log_level = vim.log.levels.DEBUG,
--           cwd = '/data', -- Inside the container
--           root_dir = function()
--             return '/data' -- Inside the container
--           end,
--           -- command = function()
--           -- return 'docker compose exec apiaccounting pytest'
--           -- return '/data/scripts/run-tests.sh'
--           -- end,
--           command = function()
--             return '/home/developer1/alayadev/accloud-lde/services/api.accounting/scripts/run-tests.sh'
--           end,
--           args = function(file)
--             local mappings = {
--               ['/home/developer1/alayadev/accloud-lde/services/api.accounting/backend/api.accounting'] = '/data',
--             }
--             for local_path, docker_path in pairs(mappings) do
--               if file:find(local_path, 1, true) then
--                 return { file:gsub(local_path, docker_path) }
--               end
--             end
--             return { file }
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
--               -- 'docker compose exec apiaccounting python -m pytest',
--               '/home/developer1/alayadev/accloud-lde/services/api.accounting/backend/api.accounting/scripts/run-tests.sh',
--             }
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
--   opts = {
--     adapters = {
--       ['neotest-python'] = {
--         dap = { justMyCode = false },
--         runner = 'pytest',
--         args = function()
--           return {
--             '--rootdir',
--             '/home/developer1/alayadev/accloud-lde/services/api.accounting/backend/api.accounting',
--           }
--         end,
--         command = function()
--           return {
--             'docker compose exec apiaccounting python -m pytest',
--           }
--         end,
--       },
--     },
--   },
-- }
