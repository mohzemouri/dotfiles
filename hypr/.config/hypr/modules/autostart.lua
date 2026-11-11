-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	-- hl.exec_cmd("/home/xynor/.config/waybar/Waybar/build/waybar")
	-- hl.exec_cmd("mako")
	-- hl.exec_cmd("swaybg -i ~/.config/hypr/wallpaper.png -m fill")
	-- hl.exec_cmd("swayosd-server")
	-- hl.exec_cmd("swaync")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
end)
