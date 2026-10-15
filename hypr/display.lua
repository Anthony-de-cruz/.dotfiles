local process = io.popen("hostname -s", "r")
local hostname = process and process:read("*l")
if process then
	process:close()
end

--- FRAMEWORK CONFIG ---
if hostname == "framework" then
	-- Ensure that lid switch is not being consumed by something like logind.
	hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("~/.config/hypr/lidswitch.sh"), { locked = true })

	----------------
	--- MONITORS ---
	----------------
	-- https://wiki.hypr.land/Configuring/Basics/Monitors/

	hl.monitor({
		output = "eDP-1",
		mode = "preferred",
		position = "0x0",
		scale = 1.566667,
	})
	hl.monitor({
		output = "DP-1",
		mode = "2560x1440@180",
		position = "auto-right", -- Right of main
		scale = 1.25,
	})
	hl.monitor({
		output = "DP-3",
		mode = "2560x1440@180",
		position = "auto-right", -- Right of main
		scale = 1.25,
	})
	hl.monitor({
		output = "HDMI-A-1",
		mode = "2560x1440@144",
		position = "auto-right", -- Right of main
		scale = 1.25,
	})

	------------------
	--- WORKSPACES ---
	------------------
	-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

	hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
	hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "5", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "6", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "7", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "8", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "9", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })

--- DEFAULT + DESKTOP CONFIG ---
else
	----------------
	--- MONITORS ---
	----------------
	-- https://wiki.hypr.land/Configuring/Basics/Monitors/

	hl.monitor({
		output = "DP-1",
		mode = "2560x1440@180",
		position = "0x0",
		scale = 1.25,
	})
	hl.monitor({
		output = "HDMI-A-1",
		mode = "2560x1440@144",
		position = "auto-right", -- Right of main
		scale = 1.25,
	})

	------------------
	--- WORKSPACES ---
	------------------
	-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

	hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
	hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "5", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "6", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "7", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "8", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "9", monitor = "DP-1" })
	hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })
end
