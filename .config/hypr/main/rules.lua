---@module 'hl'

----         ----
--   Windows   --
----         ----
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Hyprland
hl.window_rule({ match = { class = "hyprland-share-picker" }, float = true, center = true, size = { 760, 435 } })

-- GTK
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk", title = "File.*" },    float = true, center = true, size = { 880, 570 } })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk", title = "Open.*" },    float = true, center = true, size = { 880, 570 } })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk", title = "Save As.*" }, float = true, center = true, size = { 880, 570 } })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk", title = "Select.*" },  float = true, center = true, size = { 880, 570 } })

-- Nautilus
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, float = true, center = true, size = { 980, 640 } })

-- qView
hl.window_rule({ match = { class = "com.interversehq.qView" },                   float = true, center = true, size = { 1275, 770 } })
hl.window_rule({ match = { class = "com.interversehq.qView", title = "Delete" }, float = true, center = true, size = {  500, 120 } })
hl.window_rule({ match = { class = "com.interversehq.qView", title = "Open.*" }, float = true, center = true, size = {  500, 120 } })
hl.window_rule({ match = { class = "qview",                  title = "Open.*" }, float = true, center = true, size = {  880, 570 } })

-- MPV
hl.window_rule({ match = { class = "mpv" }, float = true, center = true, size = { 1275, 770 } })

-- OBS Studio
hl.window_rule({ match = { class = "com.obsproject.Studio", title = "Filters.*" }, float = true, center = true, size = {  810, 520 } })
hl.window_rule({ match = { class = "com.obsproject.Studio", title = "Settings" },  float = true, center = true, size = { 1120, 760 } })

----        ----
--   Layers   --
----        ----
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules

hl.layer_rule({ match = { namespace = "hyprpaper" },  no_anim = true })
hl.layer_rule({ match = { namespace = "hyprpicker" }, no_anim = true })
hl.layer_rule({ match = { namespace = "selection" },  no_anim = true })

hl.layer_rule({ match = { namespace = "notif.*" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "rofi" },    ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "waybar" },  ignore_alpha = 0 })
