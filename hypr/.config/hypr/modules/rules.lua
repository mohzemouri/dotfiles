-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.

---LAYER RULES---
-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.layer_rule({
	name = "noctalia-no-anim",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
})

hl.layer_rule({
	name = "noctalia-blur",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

---WINDOW RULES---
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({ -- Fix some dragging issues with XWayland
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

-- Noctalia Settings
hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = "monitor_w*0.5625 monitor_h*0.85",
})

---WORKSPACE RULES---
-- hl.workspace_rule({ workspace = "3", layout = "monocle", gaps_out = 0, border_size = 0 })

-- hl.workspace_rule({ workspace = "1", monitor = "DP-1", persistent = true, default_name = "web" })
-- hl.workspace_rule({ workspace = "2", monitor = "DP-1", persistent = true, default_name = "code" })
-- hl.workspace_rule({ workspace = "3", monitor = "DP-1", persistent = true, default_name = "chat" })
-- hl.workspace_rule({ workspace = "4", monitor = "DP-1", persistent = true, default_name = "game" })
-- hl.workspace_rule({ workspace = "5", monitor = "DP-1", persistent = true, default_name = "design" })
