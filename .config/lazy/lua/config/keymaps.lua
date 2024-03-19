-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local telescope = require("telescope.builtin")

map("n", "Q", "@qj", { desc = "Run Q Macro", remap = true })
map("x", "Q", ":norm @q<CR>", { desc = "Run Q Macro", remap = true })

-- map("n", "J", "mzJ`z", { desc = "", remap = true })
map("n", "<C-d>", "<C-d>zz", { desc = "", remap = true })
map("n", "<C-u>", "<C-u>zz", { desc = "", remap = true })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "", remap = true })
map("n", "<leader>s", [[:/<C-r><C-w>]], { desc = "", remap = true })
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "", remap = true })

-- Marks
map("n", "<leader>mh", "mH", { desc = "Set mark H", remap = true })
map("n", "<leader>mj", "mJ", { desc = "Set mark J", remap = true })
map("n", "<leader>mk", "mK", { desc = "Set mark K", remap = true })
map("n", "<leader>ml", "mL", { desc = "Set mark L", remap = true })
--
map("n", "<leader>h", "'H", { desc = "Go to mark H", remap = true })
map("n", "<leader>j", "'J", { desc = "Go to mark J", remap = true })
map("n", "<leader>k", "'K", { desc = "Go to mark K", remap = true })
map("n", "<leader>l", "'L", { desc = "Go to mark L", remap = true })

-- Telescope
map("n", "<leader>a", ":Telescope lsp_document_symbols<CR>", { desc = "Seach document symbols" })
map("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })
map("n", "<C-p>", telescope.git_files, { desc = "Git Files" })
map("n", "<leader>ps", function()
  telescope.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep String" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Live Grep" })

map("n", "<leader>fb", telescope.buffers, { desc = "Find Buffers" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Find Help Tags" })
map("n", "<leader>km", telescope.keymaps, { desc = "Find Keymap" })

-- Nvim Comment
map("n", "<leader>/", ":CommentToggle<CR>", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", ":CommentToggle<CR>", { desc = "Toggle Comment", remap = true })
