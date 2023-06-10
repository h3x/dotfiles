local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd>DapToggleBreakpoint<CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>tt"] = {
      function()
        require('dap-python').test_method()
      end
    },
   ["<leader>tr"] = {
      function()
       require('dap-python').debug_selection()
      end
    }
  }
}

return M
