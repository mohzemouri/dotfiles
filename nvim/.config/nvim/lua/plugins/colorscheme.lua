-- Helper function to remove background colors from core UI elements
local function set_transparent()
	local groups = {
		"Normal", -- Main editor background
		"NormalNC", -- Inactive/unfocused window background
		"NormalFloat", -- Floating windows (e.g., LSP hover, popups)
		"FloatBorder", -- Borders around floating windows
		"SignColumn", -- Gutter column (git signs, diagnostics, line markers)
		"StatusLine", -- Active statusline at the bottom
		"StatusLineNC", -- Inactive statusline
		"EndOfBuffer", -- Empty lines (`~`) below the end of a file
		"MsgArea", -- Command-line and message area at the bottom
	}

	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
end

-- Custom highlights specifically for Matugen (Base16)
local function apply_matugen_highlights()
	local base16_ok, base16 = pcall(require, "base16-colorscheme")
	if not base16_ok or not base16.colors then
		return
	end

	local c = base16.colors
	local hi = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- Apply transparency + custom Base16 palette overrides
	set_transparent()
	hi("Normal", { fg = c.base05, bg = "NONE" })
	hi("NormalNC", { fg = c.base05, bg = "NONE" })
	hi("Comment", { fg = c.base03, italic = true })
	hi("CursorLine", { bg = c.base01 })
end

-- Automatically re-apply transparency whenever a Catppuccin colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "catppuccin*",
	callback = set_transparent,
})

-- Safely check if the "matugen" module exists without crashing if it is missing
local ok, matugen = pcall(require, "matugen")

if ok then
	-- Re-apply Matugen highlights automatically if you reload your theme live
	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "*",
		callback = function()
			if not (vim.g.colors_name and vim.g.colors_name:match("^catppuccin")) then
				apply_matugen_highlights()
			end
		end,
	})

	matugen.setup()
	apply_matugen_highlights()
else
	-- Fallback when matugen is unavailable:
	vim.cmd.colorscheme("catppuccin")
	set_transparent()
end
