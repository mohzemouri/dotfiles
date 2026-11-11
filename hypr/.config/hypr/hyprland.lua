-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

require("modules.keybind")
require("modules.monitors")
require("modules.autostart")
require("modules.env")
require("modules.permissions")
require("modules.looknfeel")

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
	-- cursor = {
	-- 	no_hardware_cursors = true,
	-- },
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "fr, ara",
		kb_variant = "azerty",
		kb_model = "",
		kb_options = "grp:shifts_toggle",
		kb_rules = "",

		repeat_rate = 25,
		repeat_delay = 300,

		follow_mouse = 1,
		numlock_by_default = true,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

-- local suppressMaximizeRule = hl.window_rule({
-- 	-- Ignore maximize requests from all apps. You'll probably like this.
-- 	name = "suppress-maximize-events",
-- 	match = { class = ".*" },
--
-- 	suppress_event = "maximize",
-- })
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "fightcade",
	match = { class = "fcadefbneo.exe" },

	float = true,
	workspace = "5",
})
-- hl.workspace_rule({ workspace = "1", monitor = "DP-1", persistent = true, default_name = "web" })
-- hl.workspace_rule({ workspace = "2", monitor = "DP-1", persistent = true, default_name = "code" })
-- hl.workspace_rule({ workspace = "3", monitor = "DP-1", persistent = true, default_name = "chat" })
-- hl.workspace_rule({ workspace = "4", monitor = "DP-1", persistent = true, default_name = "game" })
-- hl.workspace_rule({ workspace = "5", monitor = "DP-1", persistent = true, default_name = "design" })

-- For Noctalia Color templates
require("noctalia").apply_theme()
