-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = { 'tmux' }

config.audible_bell = "Disabled"
config.default_cursor_style = "BlinkingBlock"
config.color_scheme = "PaleNight"
config.colors = {
	-- foreground = "#ffffff",
	background = "#1C1D24",
	cursor_bg = "silver",
	cursor_fg = "black",
}
config.default_domain = "WSL:Ubuntu-22.04"
config.enable_tab_bar = false

config.font = wezterm.font("MesloLGS NF")
config.font_size = 10.0

config.custom_block_glyphs = true
config.anti_alias_custom_block_glyphs = true
config.window_padding = {
	left = 4,
	right = 0,
	top = 4,
	bottom = 4,
}

-- config.unix_domains = {
--   {
--     name = 'wsl',
--     -- Override the default path to match the default on the host win32
--     -- filesystem.  This will allow the host to connect into the WSL
--     -- container.
--     socket_path = '/mnt/c/Users/ffvc/.local/share/wezterm/sock',
--     -- NTFS permissions will always be "wrong", so skip that check
--     skip_permissions_check = true,
--   },
-- }

return config
