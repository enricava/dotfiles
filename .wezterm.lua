-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true

config.adjust_window_size_when_changing_font_size = false

config.window_background_opacity = .9

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.keys = {
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
