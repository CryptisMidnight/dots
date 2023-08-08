-- Main User Files and configs, 
--  change this to your main directory like "~/.config" or "C:/Users/%username%/.config"
userF = 'C:/Users/Cryptis/.config'

local wz = require 'wezterm'        -- base required
local back = require 'extra.backg'  -- this sets the Background
local clrs = require 'extra.color'  -- sets the color scheme, currently on my custom on GoSh
local bind = require 'extra.bind'   -- these are the mouse and keybinds 
local tabs = require 'extra.tabs'   -- menu and tabs customizations

return {
  --line_height = 1.1,
  max_fps = 60,
  enable_tab_bar = true,
  initial_rows = 40,
  initial_cols = 140,
  hide_tab_bar_if_only_one_tab = false,
  --allow_win32_input_mode = true,
  --win32_system_backdrop = 'Acrylic',
  show_tab_index_in_tab_bar = false,
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,
	adjust_window_size_when_changing_font_size = false,
  window_decorations = 'INTEGRATED_BUTTONS|RESIZE',
  --integrated_title_button_style = 'Gnome',
  --integrated_title_button_color = clrs.brights[8],
  integrated_title_buttons = { 'Hide', 'Close' },
  integrated_title_button_alignment = "Right",
  cursor_blink_rate = 500,
  default_cursor_style = 'BlinkingBar',
  force_reverse_video_cursor = true,
  window_close_confirmation = 'NeverPrompt',
  default_prog = {'pwsh.exe', '-NoLogo' },
  default_workspace = 'main',
  use_fancy_tab_bar = false,
  automatically_reload_config = true,
  --front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",
-- Colors
  colors = clrs,
  term = "xterm-256color",
  window_frame = {
    active_titlebar_bg = clrs.background,
    inactive_titlebar_bg = clrs.background,
  },
  command_palette_fg_color = clrs.ansi[3],
  command_palette_bg_color = clrs.selection_fg,   
  tab_bar_style = tabs.style,
  launch_menu = tabs.launcher,
--BackGround
  font_size = 12.0,
  background = back.ground,
  inactive_pane_hsb = back.pane,
  window_padding = back.padd,
  font = back.font,
-- Bindings
  disable_default_key_bindings = true,
  mouse_bindings = bind.mouse,
  leader = bind.leader,
  keys = bind.keys,
  key_tables = bind.tables,
}
