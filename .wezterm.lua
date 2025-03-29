-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme
local coolnight = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

local coolnight_dark = {
	foreground = "#CBE0F0",
	background = "#161819",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

local gruvbox_material_dark = {
	foreground = "#D4BE98",
	background = "#161819",
	cursor_bg = "#D4BE98",
	cursor_border = "#D4BE98",
	cursor_fg = "#1D2021",
	selection_bg = "#D4BE98",
	selection_fg = "#3C3836",

	ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
}

local gruvbox_medium = {
	foreground = "#D4BE98",
	background = "#282828",
	cursor_bg = "#D4BE98",
	cursor_border = "#D4BE98",
	cursor_fg = "#282828",
	selection_bg = "#D4BE98",
	selection_fg = "#45403d",

	ansi = { "#282828", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
}

config.colors = coolnight_dark

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.93
config.macos_window_background_blur = 1
-- make copy paste work
--config.enable_clipboard = true
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action({ CopyTo = "Clipboard" }),
	},
}
-- open links on click
-- config.hyperlink_rules = {
-- Open all links in the default browser
-- This is the default rule, so we don't need to specify it
-- { regex = "https?://[^\\s]+", hyperlink = "$0" },
-- Open all links in the default browser
-- 	{ regex = "https?://[^\\s]+", hyperlink = "$0" },
-- 	{ regex = "ssh://[^\\s]+", hyperlink = "$0" },
-- 	{ regex = "file://[^\\s]+", hyperlink = "$0" },
-- }

-- and finally, return the configuration to wezterm
return config
