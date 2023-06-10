local config = require("nvim-treesitter.configs")

config.setup({
  ensure_installed = { "elixir", "heex", "eex" },
  sync_install = false,
  hightlight = {
    enable = true,
  },
})

