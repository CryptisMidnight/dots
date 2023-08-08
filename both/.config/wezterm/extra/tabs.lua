local wz = require 'wezterm'
local symb = wz.nerdfonts
local clrs = require 'extra.color'

function sbase(pth)
  local path = string.gsub(pth, "(.*[/\\])(.*)", "%2")
  return path:gsub("%.exe$", "")
end

function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

-- Shapes
local upTb = symb.ple_upper_right_triangle
--local rtTb = symb.ple_upper_left_triangle
--local ltTb = symb.ple_left_half_circle_thick
--local rtTb = symb.ple_right_half_circle_thick  
local ltTb = symb.ple_lower_right_triangle
local rtTb = symb.ple_lower_left_triangle

--Colors
local clfg = clrs.foreground
local clbg = clrs.background
local ltbg = clrs.selection_fg
local blck = clrs.ansi[1]
local dred = clrs.ansi[2]
local lpnk = clrs.brights[4]
local orgn = clrs.ansi[4]
local prpl = clrs.ansi[6]
local dgry = clrs.brights[1]
local slvr = clrs.ansi[8]
local dgrn = clrs.ansi[3]
local lgrn = clrs.brights[6]
local ltbl = clrs.ansi[7]

-- Icons
local ssh_ic = symb.cod_globe
local psh_ic = symb.cod_terminal_powershell
local bsh_ic = symb.cod_terminal_bash
local fsh_ic = '󰈺'
local ukn_ic = symb.cod_terminal
local mpv_ic = symb.cod_play_circle
local amf_ic = '󰪁'
local ydl_ic = symb.fa_arrow_down
local mcr_ic = symb.dev_code

wz.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    local tb_bg = clbg
    local process = tab.active_pane.foreground_process_name
    local exttl = sbase(process)

    -- icons per task
    if exttl == "pwsh" then
      ttl_ic = psh_ic .. " PS"
    elseif exttl == "ssh" then
      ttl_ic = ssh_ic .. " SSH"
    elseif exttl == "fish" then
      ttl_ic = fsh_ic .. " FISH"
    elseif exttl == "bash" then
      ttl_ic = bsh_ic .. " BASH"
    elseif exttl == "amfora" then
      ttl_ic = amf_ic .. " Amfora"
    elseif exttl == "yt-dlp" then
      ttl_ic = ydl_ic .. " ytDl"
    elseif exttl == "micro" then
      ttl_ic = mcr_ic .. " MICRO"
    elseif exttl == "mpv" then
      ttl_ic = mpv_ic .. " MPV"
    else
      ttl_ic = ukn_ic ..' '..exttl
    end 
    
    title = wz.truncate_right(ttl_ic, max_width - 2)

    if tab.is_active then      
      main = blck
      fore = orgn
      txtT = ' 󰍟 ' .. title .. ' '
    elseif hover then   
      main = ltbg
      fore = lgrn
      txtT = ' ' .. title .. ' '
    else         
      main = ltbg
      fore = slvr
      txtT = ' ' .. title .. ' '
    end
    return {
      { Background = { Color = tb_bg } },
      { Foreground = { Color = main } },
      { Text = ltTb },
      { Background = { Color = main } },
      { Foreground = { Color = fore } },
      { Text = txtT },
      { Background = { Color = tb_bg } },
      { Foreground = { Color = main } },
      { Text = rtTb },
    }
  end
)

--function dbase(sb)
--  return string.gsub(sb, '(.*[/\\])(.*)', '%2')
--end
wz.on('update-right-status', function(window, pane)
  local dir = pane:get_current_working_dir()
  dir = dir:sub(9)
  local slsh = dir:find '/'
  local wrk = window:active_workspace()
  local gtt = pane:get_title()
  window:set_right_status(
    wz.format {
      { Background = { Color = clbg } },
      { Foreground = { Color = prpl } },
      { Text = ' ' .. dir:sub(slsh) .. ' ' },
      { Background = { Color = clbg } },
      { Foreground = { Color = ltbg } },
      { Text = ltTb },
      { Background = { Color = ltbg } },
      { Foreground = { Color = dgrn } },
      { Text = ' ' .. wrk .. ' ' },
      { Background = { Color = ltbg } },
      { Foreground = { Color = blck } },
      { Text = upTb },
      { Background = { Color = blck } },
      { Foreground = { Color = ltbl } },
      { Text = ' ' .. sbase(gtt) .. ' ' },
      { Background = { Color = clbg } },
      { Foreground = { Color = blck } },
      { Text = rtTb },
    }
  )
end)
return {
  style ={
    -- Close ans Min buttons
    window_close = wz.format {
      { Background = { Color = clbg } },
      { Foreground = { Color = dred } },
      { Text = '  󰍳 ' },
    },
    window_close_hover  = wz.format {
      { Background = { Color = clbg } },
      { Foreground = { Color = dred } },
      { Text = '  󱎘 ' },
    },
    window_hide = wz.format {
      { Background = { Color = clbg } },
      { Foreground = { Color = lpnk } },
      { Text = '  ' },
    },
    window_hide_hover = wz.format {
      { Background = { Color = clbg } },
      { Foreground = { Color = lpnk } },
      { Text = '  ' },
    },
  },
  launcher = {
    -- Menu Items
    {
      label = 'Powershell',
      args  = {'pwsh', '-NoLogo' },
    },
    {
      label = 'Amfora',
      args  = {'amfora'},
    },
    {
      label = '',
      args  = {'ssh', '' },
    }
  },   
}