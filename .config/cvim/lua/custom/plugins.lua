-- local overrides = require("custom.configs.overrides")
local plugins = {
   {
    "mhanberg/elixir.nvim",
     config = function()
       require("elixir").setup()
    end,
   },
   {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup({
        mapping = { "kj" },
      })
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
     "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
          require("dap-go").setup(opts)
          require("core.utils").load_mappings("dap_go")
        end
  },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_,opts)
          require("gopher").setup(opts)
          require("core.utils").load_mappings("gopher")
        end,
        build = function()
          vim.cmd [[silent! GoInstallDeps]]
        end,
    },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
        ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "gopls",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
    {
        "neoclide/coc.nvim", branch = "release"
    },
    {
        "yaegassy/coc-volar", run = "yarn install"
    },
    {
        "yaegassy/coc-volar-tools", run = "yarn install"
    },
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        cmd = "Copilot",
        opts = function()
          require("copilot").setup({
            suggestion = {
                auto_trigger = true,
            }
          })
        end
    },
}
return plugins
