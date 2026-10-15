-------------------
--- EXECUTABLES ---
-------------------
return {
	-- Desktop
	status_bar = "waybar",
	wallpaper_d = "hyprpaper",
	notification_d = "mako",
	screenshot = "hyprshot -m output --clipboard-only",
	screenshot_area = "hyprshot -m region --clipboard-only",

	-- Applications
	-- launcher = "hyprlauncher",
	launcher = "pkill wofi || wofi wofi --show drun", -- Kill wofi if it is already running
	terminal = "kitty",
	file_manager = "nautilus",
	browser = "zen-beta",
}
