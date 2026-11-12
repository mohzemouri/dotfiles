---@class utils.statusline
local M = {}

--- Shows the register a macro is currently being recorded into.
--- Pair with "RecordingEnter"/"RecordingLeave" in lualine's `options.refresh.events`
--- so it appears and disappears without waiting for the refresh timer.
---@param opts? {icon?:string, color?:table|fun():table}
function M.macro_recording(opts)
	opts = vim.tbl_extend("force", {
		icon = "󰑋 ",
		color = function()
			return { fg = Snacks.util.color("DiagnosticError"), gui = "bold" }
		end,
	}, opts or {})

	return {
		function()
			return opts.icon .. vim.fn.reg_recording()
		end,
		cond = function()
			return vim.fn.reg_recording() ~= ""
		end,
		color = opts.color,
	}
end

M.catppuccin_theme = {
	normal = {
		a = { bg = "#89b4fa", fg = "#181825", gui = "bold" },
		b = { bg = "#313244", fg = "#89b4fa" },
		c = { bg = "NONE", fg = "#cdd6f4" },
	},
	insert = {
		a = { bg = "#a6e3a1", fg = "#181825", gui = "bold" },
		b = { bg = "#313244", fg = "#a6e3a1" },
		c = { bg = "NONE", fg = "#cdd6f4" },
	},
	terminal = {
		a = { bg = "#a6e3a1", fg = "#181825", gui = "bold" },
		b = { bg = "#313244", fg = "#a6e3a1" },
		c = { bg = "NONE", fg = "#cdd6f4" },
	},
	command = {
		a = { bg = "#fab387", fg = "#181825", gui = "bold" },
		b = { bg = "#313244", fg = "#fab387" },
		c = { bg = "NONE", fg = "#cdd6f4" },
	},
	visual = {
		a = { bg = "#cba6f7", fg = "#181825", gui = "bold" },
		b = { bg = "#313244", fg = "#cba6f7" },
		c = { bg = "NONE", fg = "#cdd6f4" },
	},
	replace = {
		a = { bg = "#f38ba8", fg = "#181825", gui = "bold" },
		b = { bg = "#313244", fg = "#f38ba8" },
		c = { bg = "NONE", fg = "#cdd6f4" },
	},
	inactive = {
		a = { bg = "NONE", fg = "#89b4fa" },
		b = { bg = "NONE", fg = "#45475a", gui = "bold" },
		c = { bg = "NONE", fg = "#6c7086" },
	},
}

function M.get_theme()
	if vim.g.colors_name == "catppuccin" then
		return M.catppuccin_theme
	end
	return "auto"
end

return M
