---@module 'hl'

-- https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	general = {
		border_size = 3,
		gaps_in     = 0,
		gaps_out    = 0,
		col = {
			inactive_border = "rgba(11111bff)",
			active_border   = "rgba(b4befeff)",
		},
		modal_parent_blocking = false,
		snap = {
			enabled = true,
		},
	},
})

hl.config({
	decoration = {
		blur = {
			enabled = false,
		},
		shadow = {
			enabled = false,
		},
	},
})

hl.config({
	animations = {
		enabled = true,
	},
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.animation({ leaf = "windows",      enabled = true, speed = 3.0, bezier = "default", style = "slide" })
hl.animation({ leaf = "layers",       enabled = true, speed = 1.5, bezier = "default", style = "slide" })
hl.animation({ leaf = "fade",         enabled = true, speed = 1.5, bezier = "default" })
hl.animation({ leaf = "workspaces",   enabled = true, speed = 3.0, bezier = "default", style = "slide" })
hl.animation({ leaf = "monitorAdded", enabled = false })

hl.config({
	input = {
		kb_options   = "caps:swapescape",
		repeat_delay = 300,
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.config({
	gestures = {
		workspace_swipe_forever = true,
	},
})

hl.gesture({
	fingers   = 3,
	direction = "horizontal",
	action    = "workspace",
})

hl.config({
	group = {
		auto_group = false,
		groupbar = {
			enabled = false,
		},
	},
})

hl.config({
	misc = {
		disable_hyprland_logo      = true,
		disable_splash_rendering   = true,
		font_family                = "CommitMono Nerd Font",
		force_default_wallpaper    = 0,
		disable_autoreload         = true,
		focus_on_activate          = true,
		initial_workspace_tracking = 2,
		middle_click_paste         = false,
	},
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.config({
	cursor = {
		inactive_timeout = 5,
		no_warps         = true,
		zoom_disable_aa  = true,
	},
})

hl.config({
	ecosystem = {
		no_update_news  = true,
		no_donation_nag = true,
	},
})
