return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for install instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'harpoon')
    pcall(require('telescope').load_extension, 'rest')

    -- Define a custom filter function to ignore test files
    local function filter_out_test_files(results)
      local filtered_results = {}
      for _, result in ipairs(results) do
        -- You can modify this condition based on your test file naming conventions
        if not string.match(result.display, 'test') then
          table.insert(filtered_results, result)
        end
      end
      return filtered_results
    end

    -- Function to call Telescope with custom filter
    local function search_files(should_include_tests)
      require('telescope.builtin').find_files {
        -- Pass the custom filter function to Telescope
        attach_mappings = function(_, map)
          map('i', '<cr>', function(prompt_bufnr)
            local selection = require('telescope.actions.state').get_selected_entry()
            require('telescope.actions').close(prompt_bufnr)
            vim.cmd(string.format('e %s', selection.path))
          end)
          return true
        end,
        -- Apply custom filter based on the condition
        filter = should_include_tests and nil or filter_out_test_files,
      }
    end

    -- Define a custom function that calls find_files with custom filtering
    local function custom_find_files()
      require('telescope.builtin').find_files {
        attach_mappings = function(_, map)
          map('i', '<cr>', function(prompt_bufnr)
            local selection = require('telescope.actions.state').get_selected_entry()
            require('telescope.actions').close(prompt_bufnr)
            vim.cmd(string.format('e %s', selection.path))
          end)
          return true
        end,
        filter = should_include_tests and nil or filter_out_test_files,
      }
    end

    -- Define the keymap with the custom function
    vim.keymap.set('n', '<leader>ft', custom_find_files, { desc = '[S]earch [F]iles' })
    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>fa', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('v', '<leader>fg', 'zy:Telescope live_grep default_text="<C-r>z<CR>"', { desc = '[S]earch by [G]rep' })
    -- default_text = table.concat(get_selection())
    --
    -- TODO: Adam make this work. maybe upgrade to nvim nightly
    -- local get_selection = function()
    --   return vim.fn.getregion(vim.fn.getpos '.', vim.fn.getpos 'v', { mode = vim.fn.mode() })
    -- end
    --
    -- vim.keymap.set('v', '<leader>fg', builtin.live_grep { default_text = table.concat(get_selection()) }, { desc = '[S]earch by [G]rep' })

    vim.keymap.set('n', '<leader>S', function()
      builtin.grep_string {
        previewer = true,
      }
    end, { desc = '[S]earch current [W]ord' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>fb', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
