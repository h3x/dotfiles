local config = require("nvim-treesitter.configs")

config.setup({
  ensure_installed = { "javascript", "lua", "elixir", "heex", "eex" },
  auto_install = true,
  sync_install = false,
  hightlight = {
    enable = true,
  },
})

