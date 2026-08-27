---@module 'hl'

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE",    "wayland")

-- Qt
hl.env("QT_QPA_PLATFORM",      "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_SCALE_FACTOR", 1)
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)

-- Nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("WLR_DRM_NO_ATOMIC",       1)
hl.env("WLR_NO_HARDWARE_CURSORS", 1)
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_VRR_ALLOWED", 1)

-- Cursor
hl.env("HYPRCURSOR_THEME", "macOS")
hl.env("HYPRCURSOR_SIZE",  36)
hl.env("QT_CURSOR_THEME",  "macOS")
hl.env("QT_CURSOR_SIZE",   36)
hl.env("XCURSOR_THEME",    "macOS")
hl.env("XCURSOR_SIZE",     36)

-- GDK
hl.env("GDK_BACKEND", "wayland")
hl.env("GDK_SCALE",   1)

-- Misc
hl.env("MOZ_ENABLE_WAYLAND", 1)
hl.env("SLURP_ARGS", "-b 00000066 -c ff0000 -d -F 'GoogleSansCode Nerd Font'")
hl.env("_JAVA_AWT_WM_NONREPARENTING", 1)
