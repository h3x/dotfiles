return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'theHamsta/nvim-dap-virtual-text',
    'mfussenegger/nvim-dap-python',
    'rcarriga/cmp-dap',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    dap.adapters.python = {
      type = 'executable',
      command = 'python3',
      args = { '-m', 'debugpy.adapter' },
    }

    local dapui = require 'dapui'

    local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
    require('dap-python').setup(path)

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = {
        'delve',
        'debugpy',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    local hide_info = function()
      print 'hide'
      vim.diagnostic.disable()
      vim.api.nvim_command ':Gitsigns toggle_current_line_blame'
    end

    local show_info = function()
      vim.diagnostic.enable()
      vim.api.nvim_command ':Gitsigns toggle_current_line_blame'
    end

    dap.listeners.after.event_initialized['dapui_config'] = function()
      hide_info()
      dapui.open {}
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      show_info()
      dapui.close {}
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      show_info()
      dapui.close {}
    end

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      layouts = {
        {
          elements = {
            {
              id = 'stacks',
              size = 0.5,
            },
            {
              id = 'breakpoints',
              size = 0.25,
            },
          },
          position = 'left',
          size = 40,
        },
        {
          elements = {
            {
              id = 'repl',
              size = 0.5,
            },
            {
              id = 'scopes',
              size = 0.5,
            },
          },
          position = 'bottom',
          size = 20,
        },
      },
    }

    dap.set_log_level 'TRACE'

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- local pythonAttachConfig = {
    --   type = 'python',
    --   request = 'attach',
    --   connect = {
    --     port = 5678,
    --     host = '0.0.0.0',
    --   },
    --   mode = 'remote',
    --   name = 'Container Attach (with choose remote dir)',
    --   cwd = vim.fn.getcwd(),
    --   pathMappings = {
    --     {
    --       localRoot = vim.fn.getcwd(),
    --       remoteRoot = function()
    --         -- NEED to choose correct folder for set breakpoints
    --         return vim.fn.input('Container code folder > ', '.', 'file')
    --       end,
    --     },
    --   },
    -- }
    -- table.insert(require('dap').configurations.python, pythonAttachConfig)

    table.insert(require('dap').configurations.python, {
      type = 'python',
      request = 'attach',
      name = 'Attach remote (with path mapping)',
      mode = 'remote',
      connect = { host = 'localhost', port = 5678 },
      pathMappings = {
        ['/home/developer1/alayadev/accloud-lde/services/api.accounting/'] = '/data',
      },
    })

    -- change Breakpoint icon
    vim.fn.sign_define('DapBreakpoint', {
      text = '🅑 ',
      texthl = '',
      linehl = '',
      numhl = '',
    })
    -- setup dap autocomplition
    require('cmp').setup {
      enabled = function()
        return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt' or require('cmp_dap').is_dap_buffer()
      end,
    }

    require('cmp').setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
      sources = {
        { name = 'dap' },
      },
    })

    -- Install golang specific config
    require('dap-go').setup()
  end,
}
