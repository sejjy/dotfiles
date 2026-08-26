---@module 'hl'

-- https://wiki.hypr.land/Configuring/Basics/Binds/

local scripts  = "~/.local/bin/"
local super    = "SUPER"
local terminal = "kitty"

hl.bind(super .. " + CTRL + W", hl.dsp.exec_cmd("pkill waybar || waybar"))

-- Apps
hl.bind(super .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(super .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(super .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(super .. " + F", hl.dsp.exec_cmd("zen-browser"))

-- Rofi
hl.bind(super .. " + A", hl.dsp.exec_cmd(scripts .. "launch app"))
hl.bind(super .. " + X", hl.dsp.exec_cmd(scripts .. "launch calc"))
hl.bind(super .. " + V", hl.dsp.exec_cmd(scripts .. "launch clip"))
hl.bind(super .. " + M", hl.dsp.exec_cmd(scripts .. "launch emoji"))
hl.bind(super .. " + W", hl.dsp.exec_cmd(scripts .. "launch win"))

-- CLIs
hl.bind(super .. " + B", hl.dsp.exec_cmd(terminal .. " -e " .. scripts .. "bluetooth menu"))
hl.bind(super .. " + N", hl.dsp.exec_cmd(terminal .. " -e " .. scripts .. "network menu"))
hl.bind(super .. " + O", hl.dsp.exec_cmd(terminal .. " -e " .. scripts .. "power"))
hl.bind(super .. " + U", hl.dsp.exec_cmd(terminal .. " -e " .. scripts .. "update"))

-- Turn off Bluetooth/Wi-Fi
hl.bind(super .. " + ALT + B", hl.dsp.exec_cmd(scripts .. "bluetooth off"))
hl.bind(super .. " + ALT + N", hl.dsp.exec_cmd(scripts .. "network off"))

-- Audio
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd(scripts .. "volume input mute"),  { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(scripts .. "volume output mute"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scripts .. "volume output down"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scripts .. "volume output up"),   { locked = true })
hl.bind(super .. " + ALT + M",  hl.dsp.exec_cmd(scripts .. "volume output mute"), { locked = true })
hl.bind(super .. " + ALT + L",  hl.dsp.exec_cmd(scripts .. "volume output down"), { locked = true })
hl.bind(super .. " + ALT + R",  hl.dsp.exec_cmd(scripts .. "volume output up"),   { locked = true })

-- Media
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scripts .. "backlight down"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(scripts .. "backlight up"),   { locked = true })
hl.bind(super .. " + ALT + D",   hl.dsp.exec_cmd(scripts .. "backlight down"), { locked = true })
hl.bind(super .. " + ALT + U",   hl.dsp.exec_cmd(scripts .. "backlight up"),   { locked = true })

-- Screenshot
hl.bind("Print",                hl.dsp.exec_cmd(scripts .. "screenshot area"),   { locked = true })
hl.bind(super .. " + P",        hl.dsp.exec_cmd(scripts .. "screenshot area"),   { locked = true })
hl.bind(super .. " + Print",    hl.dsp.exec_cmd(scripts .. "screenshot screen"), { locked = true })
hl.bind(super .. " + CTRL + P", hl.dsp.exec_cmd(scripts .. "screenshot screen"), { locked = true })
hl.bind(super .. " + ALT + P",  hl.dsp.exec_cmd(scripts .. "screenshot active"), { locked = true })

-- Zoom
hl.bind(super .. " + SHIFT + mouse:272", hl.dsp.exec_cmd(scripts .. "zoom 0.5"))
hl.bind(super .. " + SHIFT + mouse:273", hl.dsp.exec_cmd(scripts .. "zoom reset"))

----         ----
--   Windows   --
----         ----

-- Change mode
hl.bind(super .. " + Return",    hl.dsp.window.fullscreen())
hl.bind(super .. " + SHIFT + W", hl.dsp.window.float())

-- Change focus
hl.bind(super .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(super .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(super .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(super .. " + L", hl.dsp.focus({ direction = "right" }))

-- Cycle through windows
hl.bind(super .. " + Backslash", function()
	hl.dispatch(hl.dsp.window.cycle_next())
	hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Resize
hl.bind(super .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(super .. " + SHIFT + H", hl.dsp.window.resize({ x = -20, y =   0, relative = true }))
hl.bind(super .. " + SHIFT + J", hl.dsp.window.resize({ x =   0, y =  20, relative = true }))
hl.bind(super .. " + SHIFT + K", hl.dsp.window.resize({ x =   0, y = -20, relative = true }))
hl.bind(super .. " + SHIFT + L", hl.dsp.window.resize({ x =  20, y =   0, relative = true }))

-- Close
hl.bind(super .. " + Q", hl.dsp.window.close())

-- Move
hl.bind(super .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(super .. " + SHIFT + CTRL + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(super .. " + SHIFT + CTRL + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(super .. " + SHIFT + CTRL + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(super .. " + SHIFT + CTRL + L", hl.dsp.window.move({ direction = "right" }))

for i = 1, 10 do
	local key = i % 10
	-- Move to a workspace [0-9]
	hl.bind(super .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	-- Move to a workspace silently [0-9]
	hl.bind(super .. " + ALT + " .. key,   hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move to relative workspace
hl.bind(super .. " + CTRL + ALT + H", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(super .. " + CTRL + ALT + L", hl.dsp.window.move({ workspace = "r+1" }))

-- Move to first empty
hl.bind(super .. " + SHIFT + J", hl.dsp.window.move({ workspace = "empty" }))

----            ----
--   Workspaces   --
----            ----

for i = 1, 10 do
	local key = i % 10
	-- Switch to a workspace [0-9]
	hl.bind(super .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Switch to relative
hl.bind(super .. " + CTRL + H", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(super .. " + CTRL + L", hl.dsp.focus({ workspace = "r+1" }))

-- Switch to first empty
hl.bind(super .. " + CTRL + J", hl.dsp.focus({ workspace = "empty" }))

-- Cycle through existing
hl.bind(super .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(super .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
