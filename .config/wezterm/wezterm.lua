-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Apply config

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14
config.color_scheme = 'Catppuccin Macchiato'
config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 15

-- config.use_dead_keys = false
-- config.send_composed_key_when_left_alt_is_pressed = false
-- config.send_composed_key_when_right_alt_is_pressed = true

config.keys = {
    -- Map commonly used Option key combinations to their Alt equivalents
    -- You can add more key bindings as needed
    -- {key="a", mods="ALT", action=wezterm.action.SendString("\x1ba")},
    -- {key="b", mods="ALT", action=wezterm.action.SendString("\x1bb")},
    -- {key="c", mods="ALT", action=wezterm.action.SendString("\x1bc")},
    -- {key="9", mods="ALT", action=wezterm.action.SendString("\x1b]")},
    {key="i", mods="ALT", action=wezterm.action.SendString("|")},
    {key="8", mods="ALT", action=wezterm.action.SendString("[")},
    {key="8", mods="ALT|SHIFT", action=wezterm.action.SendString("{")},
    {key="9", mods="ALT|SHIFT", action=wezterm.action.SendString("}")},
    {key="9", mods="ALT", action=wezterm.action.SendString("]")},
}
-- Return the configuration to wezterm
return config

