---@module 'hl'

-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd("dunst")     -- Notification daemon
	hl.exec_cmd("waybar")    -- System bar
	hl.exec_cmd("hypridle")  -- Idle daemon
	hl.exec_cmd("hyprpaper") -- Wallpaper daemon

	-- Authentication daemon
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")

	-- Automounter for removable media
	hl.exec_cmd("udiskie --file-manager=nautilus --no-automount")

	-- Cursor
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'macOS'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 36")
	hl.exec_cmd("hyprctl setcursor macOS 36")

	-- Clipboard
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- GTK
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")

	-- XDPH
	-- https://wiki.hypr.land/Hypr-Ecosystem/xdg-desktop-portal-hyprland/
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
