-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_padding = {
  left = 5,
  right = 3,
  top = 5,
  bottom = 3,
}

config.color_scheme = 'Dracula'
config.colors = {
  background = '#14151b'
}
config.font = wezterm.font_with_fallback({
  { family = 'RobotoMono Nerd Font', weight = 'Bold' },
  { family = 'Apple Color Emoji' }
})
config.unicode_version = 14
config.cell_width = 0.9
config.font_size = 14
config.line_height = 0.87

config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.max_fps = 120
config.prefer_egl = true

-- and finally, return the configuration to wezterm
return config
