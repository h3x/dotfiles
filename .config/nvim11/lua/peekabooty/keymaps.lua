vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', 'fg', '<C-z>')

-- file tree
vim.keymap.set('n', '<leader>re', ':Oil --float<CR>', { desc = 'Open NetRW' })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Hold highlight after tabbing in and out
vim.keymap.set('v', '>', '>gv', { desc = 'Hold highlight after tabbing in' })
vim.keymap.set('v', '<', '<gv', { desc = 'Hold highlight after tabbing out' })

-- Macros
vim.keymap.set('n', 'Q', '@qj', { desc = 'Run Q Macro', remap = true })
vim.keymap.set('x', 'Q', ':norm @q<CR>', { desc = 'Run Q Macro', remap = true })

-- Center on page up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = '', remap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = '', remap = true })

-- Search and replace
vim.keymap.set('n', '<leader>s', [[:/<C-r><C-w>]], { desc = '', remap = true })
vim.keymap.set('v', '<leader>s', 'y/<C-R>"<CR>N', { desc = '', remap = true })
vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '', remap = true })

-- Marks
vim.keymap.set('n', '<leader>mh', 'mH', { desc = 'Set mark H', remap = true })
vim.keymap.set('n', '<leader>mj', 'mJ', { desc = 'Set mark J', remap = true })
vim.keymap.set('n', '<leader>mk', 'mK', { desc = 'Set mark K', remap = true })
vim.keymap.set('n', '<leader>ml', 'mL', { desc = 'Set mark L', remap = true })
--
vim.keymap.set('n', '<leader>h', "'H", { desc = 'Go to mark H', remap = true })
vim.keymap.set('n', '<leader>j', "'J", { desc = 'Go to mark J', remap = true })
vim.keymap.set('n', '<leader>k', "'K", { desc = 'Go to mark K', remap = true })
vim.keymap.set('n', '<leader>l', "'L", { desc = 'Go to mark L', remap = true })

-- Telescope marks
vim.keymap.set('n', '<leader>mm', ':Telescope marks<CR>', { desc = 'List marks', remap = true })

-- Delete without yanking
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = '', remap = true })

-- Copilot
vim.keymap.set('n', '<leader>co', ':CopilotChatOpen<CR>', { desc = 'Open [C]opilot chat' })
vim.keymap.set('n', '<leader>ce', ':CopilotChatExplain<CR>', { desc = 'Open [C]opilot [E]xplain' })

-- [[ Maybe not needed anymore ]] --

-- -- Keybinds to make split navigation easier.
-- -- Use CTRL+<hjkl> to switch between windows
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--
--
-- -- Lazygit
-- vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Open [L]azy[G]it' })
--
-- -- tmux
-- vim.keymap.set('n', '<C-f>', '<cmd>!tmux neww tmux-sessioniser<CR>', { desc = 'Open tmux sessionizer' })
--
-- -- Lazydocker
-- vim.keymap.set('n', '<leader>ld', '<cmd>LazyDocker<CR>', { desc = 'Toggle LazyDocker', noremap = true, silent = true })
--
-- -- Neotest
-- vim.keymap.set('n', '<leader>tt', ':Neotest run<CR>', { desc = 'Run tests', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>ts', ':Neotest summary<CR>', { desc = 'Open test Summary', noremap = true, silent = true })
