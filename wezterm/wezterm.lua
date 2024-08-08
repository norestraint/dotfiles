local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'tokyonight_night'
config.enable_tab_bar = false
config.font_size = 14.0
config.font = wezterm.font 'JetBrainsMono Nerd Font'

config.cursor_blink_rate = 800
config.default_prog = { 'zsh' }
config.window_background_opacity = 1.0
config.window_decorations = 'RESIZE'

return config
