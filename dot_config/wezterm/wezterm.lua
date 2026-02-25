local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- ─── Appearance ───────────────────────────────────────────────────────────────

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("FantasqueSansM Nerd Font")
config.font_size = 14.0

config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }

-- Remove title bar, keep resize border (matches Alacritty Buttonless)
config.window_decorations = "RESIZE"

-- Translucency + blur (matches Alacritty opacity + blur)
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

-- Blinking beam cursor (matches Alacritty cursor config)
config.default_cursor_style = "BlinkingBar"

-- Option key as Alt on both sides (matches Alacritty option_as_alt = "Both")
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Dim inactive panes
config.inactive_pane_hsb = { saturation = 0.8, brightness = 0.7 }

-- No bell
config.audible_bell = "Disabled"

-- Hide tab bar when only one tab open
config.hide_tab_bar_if_only_one_tab = true

-- No close confirmation dialog
config.window_close_confirmation = "NeverPrompt"

-- ─── Shell / Startup ──────────────────────────────────────────────────────────

-- Launch fish and auto-attach to existing tmux session, or create a new one
config.default_prog = { "/opt/homebrew/bin/fish", "--login", "-c", "tmux attach; or tmux" }

-- ─── Scrollback ───────────────────────────────────────────────────────────────

config.scrollback_lines = 10000

-- ─── Key Bindings ─────────────────────────────────────────────────────────────

-- Ctrl+h/j/k/l are NOT bound here — tmux and vim-tmux-navigator handle
-- all pane navigation. WezTerm passes these keys straight through.

config.keys = {
  -- Reload WezTerm config
  { key = "r", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },

  -- Enter WezTerm copy mode (vi-style, replaces Alacritty vi mode)
  { key = "s", mods = "CTRL", action = act.ActivateCopyMode },
}

return config
