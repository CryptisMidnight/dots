local wz = require 'wezterm'
--local c = wz.color.load_scheme(..'/.config/wezterm/extra/GoSh.toml')
local p = {
    blck = '#252525', --Black
    dred = '#f52040', --Maroon
    dgrn = '#91f779', --Green
    orgn = '#fba753', --Olive
    nvbl = '#2040f5', --Navy
    prpl = '#a13ef7', --Purple
    dkcn = '#00bfff', --Teal
    slvr = '#b5b5b5', --Silver
    dgry = '#3a3a3a', --Grey
    lpnk = '#f87eaa', --Red
    lgrn = '#00e687', --Lime
    yllw = '#f6e13c', --Yellow
    ltbl = '#8172ff', --Blue
    mgnt = '#ff3ceb', --Fuchsia
    ltcn = '#0cdaff', --Aqua
    bwht = '#e0e0e0', --White
    bg   = '#050505', --Background
    fg   = '#a5a5a5', --Foreground
    lbg  = '#101010', --LightBackground
}

return {
  	foreground = p.fg,
  	background = p.bg,
  	cursor_fg = p.bwht,
    cursor_bg = p.bg,
    cursor_border = p.slvr,
    selection_bg = p.slvr,
    selection_fg = p.lbg,
    compose_cursor = p.orgn,
 	split = p.dgry,
    ansi = {
        p.blck,
        p.dred,
        p.dgrn,
        p.orgn,
        p.nvbl,
        p.prpl,
        p.dkcn,
        p.slvr,
    },
    brights = {
        p.dgry,
        p.lpnk,
        p.lgrn,
        p.yllw, 
        p.ltbl,
        p.mgnt,
        p.ltcn,
        p.bwht,
    },
    tab_bar = { 
	    background = p.bg,
        inactive_tab_edge = p.lgrn,
	    new_tab = { bg_color = p.bg, fg_color = p.slvr },
	    new_tab_hover = { bg_color = p.bg, fg_color = p.bwht, intensity = 'Bold' },
	    active_tab = { bg_color = p.blck, fg_color = p.orgn },
	    inactive_tab = { bg_color = p.lbg, fg_color = p.fg },
		},
  }