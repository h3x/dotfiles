
-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system{ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- setup plugins
require"lazy".setup{
	-- automatically check for plugin updates
	checker = { enabled = true },
	-- file explorer
	{
		"stevearc/oil.nvim",
		config = function()
			require"oil".setup{
				keymaps = {
					["<c-n>"] = { "actions.close" },
					["q"] = { "actions.close" },
				},
				view_options = {
					show_hidden = true,
				},
			}
			vim.keymap.set("n", "<c-n>", "<cmd>Oil<cr>")
		end,
	},
	-- fuzzy find
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require"telescope".setup{}

			local telescope_builtin = require"telescope.builtin"
			vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files)
			vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep)
		end,
	},
	-- language servers
	-- see config examples: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require"mason".setup{}
			require"mason-lspconfig".setup{
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
					"eslint",
					"zls",
					"clangd",
				},
			}

			local lspconf = require"lspconfig"
			lspconf.lua_ls.setup{}
			lspconf.rust_analyzer.setup{}
			lspconf.ts_ls.setup{}
			lspconf.eslint.setup{
				on_attach = function(_, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			}
			lspconf.zls.setup{}
			lspconf.clangd.setup{}
		end,
	},
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- enable completion when available
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
-- see `:h completeopt`
vim.opt.completeopt="menuone,noselect,popup"
-- map <c-space> to activate completion
vim.keymap.set("i", "<c-space>", function() vim.lsp.completion.get() end)
-- map <cr> to <c-y> when the popup menu is visible
vim.keymap.set("i", "<cr>", "pumvisible() ? '<c-y>' : '<cr>'", { expr = true })
