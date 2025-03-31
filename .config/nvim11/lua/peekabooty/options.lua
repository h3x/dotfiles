-- Set <space> as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.noswapfile = true

-- nvim11 virtual text diagnostic
vim.diagnostic.config { virtual_text = true }
-- vim.opt.swap = false

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- add relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'
vim.opt.showmode = false

-- clipboard should be system clipboard
vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.smartindent = true

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
vim.opt.hlsearch = true

-- Set tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent=true

vim.opt.termguicolors=true

