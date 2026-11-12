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

	-- Loop through each highlight group and set its background to transparent ("none")
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
end

-- Automatically re-apply transparency whenever a Catppuccin colorscheme is loaded
-- (e.g., if you manually run :colorscheme catppuccin-mocha or catppuccin-latte later)
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "catppuccin*",
	callback = set_transparent,
})

-- Safely check if the "matugen" module exists without crashing if it is missing
local ok, matugen = pcall(require, "matugen")

if ok then
	-- If matugen is installed (e.g., on Linux), initialize it with its own colors
	matugen.setup()
else
	-- Fallback when matugen is unavailable (e.g., on Windows):
	-- Load the built-in Catppuccin theme and make its background transparent
	vim.cmd.colorscheme("catppuccin")
	set_transparent()
end
