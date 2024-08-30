local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false
config.font_size = 12.0
config.font = wezterm.font 'JetBrainsMono Nerd Font'

-- config.default_cursor_style = 'BlinkingBlock'
-- config.default_cursor_style = 'BlinkingUnderline'
-- config.cursor_blink_rate = 1000
-- config.cursor_thickness = "200%"
-- config.cursor_blink_ease_in = "Linear"
-- config.cursor_blink_ease_out = "Linear"

config.default_prog = { 'zsh' }
config.window_background_opacity = 1.0
config.window_decorations = 'RESIZE'

return config
