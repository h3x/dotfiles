return {
  'saghen/blink.nvim',
  build = 'cargo build --release', -- for delimiters
  keys = {
	-- chartoggle
	{
	  '<C-;>',
	  function()
	  	require('blink.chartoggle').toggle_char_eol(';')
	  end,
	  mode = { 'n', 'v' },
	  desc = 'Toggle ; at eol',
	},
	{
	  '<C-,>',
	  function()
	  	require('blink.chartoggle').toggle_char_eol(',')
	  end,
	  mode = { 'n', 'v' },
	  desc = 'Toggle , at eol',
	},

	-- tree
	{ '<C-e>', '<cmd>BlinkTree toggle<cr>', desc = 'Reveal current file in tree' },
	{ '<C-t>', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree focus' },
  },
  -- all modules handle lazy loading internally
  lazy = false,
  opts = {
    chartoggle = { enabled = true },
    indent = { enabled = true },
    tree = { enabled = true }
  }
}
