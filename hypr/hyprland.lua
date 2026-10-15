-- See https://wiki.hypr.land/Configuring/Start/

local exec = require("exec")

----------------
--- START UP ---
----------------
-- https://wiki.hypr.land/configuring/core/autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd(exec.status_bar)
	hl.exec_cmd(exec.wallpaper_d)
	hl.exec_cmd(exec.notification_d)
	hl.exec_cmd("~/.config/hypr/lidswitch.sh") -- Init lid state.
end)

-------------------
--- ENVIRONMENT ---
-------------------
-- https://wiki.hypr.land/configuring/core/environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
	xwayland = { force_zero_scaling = true },
}) -- Unscale XWayland applications.

--------------
--- SOURCE ---
--------------

require("display")
require("keybinds")
require("cosmetic")
