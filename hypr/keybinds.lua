local exec = require("exec")

----------------
--- KEYBOARD ---
----------------
-- https://wiki.hypr.land/configuring/core/binds/keyboard-layouts/

hl.config({
	input = {
		kb_layout = "gb",
	},
})

-----------------
--- KEY BINDS ---
-----------------
-- https://wiki.hypr.land/Configuring/Basics/Binds/

-- Window Control
hl.bind("SUPER + ESCAPE", hl.dsp.exit()) -- todo: look into hyprshutdown
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + SHIFT + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with mainMod + [0-9]
-- Move the active window with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- Workspace 10 uses the 0 key
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Applications
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(exec.launcher))
hl.bind("SUPER + E", hl.dsp.exec_cmd(exec.file_manager))
hl.bind("SUPER + B", hl.dsp.exec_cmd(exec.browser))
hl.bind("SUPER + Q", hl.dsp.exec_cmd(exec.terminal))

-- Utilities
hl.bind("SUPER + I", hl.dsp.exec_cmd(exec.screenshot), { locked = true })
hl.bind("SUPER + O", hl.dsp.exec_cmd(exec.screenshot_area), { locked = true })

hl.bind("SUPER + D", hl.dsp.exec_cmd("wayscriber --active"), { locked = true })
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("wayscriber --active --freeze"), { locked = true })

-- Multimedia Control
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 5%-"), { locked = true })
