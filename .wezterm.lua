-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Dracula'
config.colors = {
  background = '#14151b'
}
config.font = wezterm.font(
  'RobotoMono Nerd Font', {
  weight = 'DemiBold',
})
config.cell_width = 0.9
config.font_size = 14

config.window_background_opacity = 0.85
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- and finally, return the configuration to wezterm
return config
