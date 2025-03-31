return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require"mason".setup{}
        require"mason-lspconfig".setup{
            -- ensure_installed = {
            --     "lua_ls",
            --     "ts_ls",
            --     "eslint",
            --     "clangd",
            --     "pyright",
            -- },
        }

        -- local lspconf = require"lspconfig"
        -- lspconf.lua_ls.setup{}
        -- lspconf.ts_ls.setup{}
        -- lspconf.eslint.setup{
        --     on_attach = function(_, bufnr)
        --         vim.api.nvim_create_autocmd("BufWritePre", {
        --             buffer = bufnr,
        --             command = "EslintFixAll",
        --         })
        --     end,
        -- }
        -- lspconf.clangd.setup{}
    end,
}
