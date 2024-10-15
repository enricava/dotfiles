-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
