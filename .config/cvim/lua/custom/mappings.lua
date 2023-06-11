local M = {}

M.general = {
    i = {
        ["<C-k>"] = { "<Up>", "Move up" },
        ["<C-c>"] = { "<Up>", "<Esc>" },
    },

    n = {
        ["J"] = { "mzJ`z", "Bring line below up to this line" },
        ["<C-d>"] = { "<C-d>zz", "Half page down" },
        ["<C-u>"] = { "<C-u>zz", "Half page down" },
        ["n"] = { "nzzzv", "Scroll through searched term" },
        ["N"] = { "Nzzzv", "Scroll backwards through searched term" },
        ["<leader>y"] = { '[["y]]', "Copy to system clipboard" },
        ["<leader>Y"] = { '[["Y]]', "Copy to system clipboard" },
        ["<leader>d"] = { '[["_d]]', "Delete to black hole" },
        ["Q"] = { "<nop>", "Unset Q" },
        ["<leader>f"] = { vim.lsp.buf.format, "Format buffer" },
        ["<C-k>"] = { "<cmd>cnext<CR>zz", "Next option" },
        ["<C-j>"] = { "<cmd>cprev<CR>zz", "Previous option" },
        ["<leader>s"] = { "[[:/<C-r><C-w>]]", "Search term unser cursor" },
        ["<leader>r"] = { "[[:%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>]]", "Replace term in buffer" },

        -- marks
        ["<leader>mh"] = { "mH", "set marks" },
        ["<leader>mj"] = { "mJ", "set marks" },
        ["<leader>mk"] = { "mK", "set marks" },
        ["<leader>ml"] = { "mL", "set marks" },
        ["<leader>h"] = { "'H", "go to marks" },
        ["<leader>j"] = { "'J", "go to marks" },
        ["<leader>k"] = { "'K", "go to marks" },
        ["<leader>l"] = { "'L", "go to marks" },

    },

    t = {
        ["<Esc>"] = { "<C-\\><C-n>", "Exit insert mode" },
    },

    v = {
        ["J"] = { ':m \'>+1<CR>gv=gv', "Move line up" },
        ["K"] = { ':m \'>-1<CR>gv=gv', "Move line down" },
        ["<leader>y"] = { '[["y]]', "Copy to system clipboard" },
        ["<leader>d"] = { '[["_d]]', "Delete to black hole" },
    },

    x = {
        ["<leader>p"] = { '[["_dP]]', "Greatest Remap Ever! - ThePrimeagen" },
    },
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>" }
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
