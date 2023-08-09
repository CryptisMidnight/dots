local wz = require 'wezterm'
local dimmer = { brightness = 0.3 }
local bg = '/wezterm/sd'
if _G.pixel == true then
  bg = '/wezterm/px'
end

return {
ground = {
    {
      source = {
        File = _G.userF..bg..'/bac1.jpg',
      },
      hsb = dimmer,
      opacity = 0.90,
      repeat_y = 'Mirror',
      repeat_x = 'NoRepeat',
      attachment = { Parallax = 0.01 },
    },
    {
      source = {
        File = _G.userF..bg..'/sys1.png',
      },
      hsb = dimmer,
      attachment = { Parallax = 0.25 },
    },
    {
      source = {
        File = _G.userF..bg..'/sys2.png',
      },
      hsb = dimmer,
      attachment = { Parallax = 0.5 },
    },
    {
      source = {
        File = {path=_G.userF..bg..'/ship.gif', speed=0.5},
      },
      hsb = dimmer,
      height = '12.5cell',
      width = '18.5cell',
      repeat_y = 'NoRepeat',
      repeat_x = 'NoRepeat',
      vertical_align = 'Middle',
      horizontal_align = 'Center',
      vertical_offset = '7%',
      horizontal_offset = '20%',
    },
    {
      source = {
        File = _G.userF..bg..'/for1.png',
      },
      hsb = dimmer,
      vertical_align = 'Bottom',
    },
  },
  pane = {
    hue =1.0,
    saturation = 1.0,
    brightness = 0.15,
  },
  padd = {
    left = '1.5%',
    right = '0.75%',
    top = '0cell',
    bottom = '0cell',
  },
  font = wz.font_with_fallback({
    'JetBrainsMono NFM SemiBold',
    'Iosevka NFM SemiBold',
  	'JetBrainsMonoNL NFM SemiBold',
    'VictorMono NFM SemiBold',
    'CaskaydiaCove NFM SemiBold',
    'FiraCode Nerd Font Mono SemBd',
  	'Menlo',
  }),
}