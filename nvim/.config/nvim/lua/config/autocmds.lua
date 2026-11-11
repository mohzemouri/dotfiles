-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	group = augroup,
	pattern = "*",
	command = "set nopaste",
})

-- Highlight the current line on only the active buffer
local cursorline_group = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	group = cursorline_group,
	pattern = "*",
	command = "setlocal cursorline",
})
vim.api.nvim_create_autocmd("WinLeave", {
	group = cursorline_group,
	pattern = "*",
	command = "setlocal nocursorline",
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Custom filetypes
vim.filetype.add({
	extension = {
		mjml = "html",
	},
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "netrw",
-- 	desc = "Better keymaps for Netrw",
-- 	callback = function()
-- 		local bind = function(lhs, rhs, desc)
-- 			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true, desc = desc })
-- 		end
--
-- 		-- Navigation (h/l to go up/open directories like a tree)
-- 		bind("h", "-", "Go up directory")
-- 		bind("l", "<CR>", "Open file or directory")
-- 		bind(".", "gh", "Toggle hidden files")
--
-- 		-- File operations (standard letters instead of symbols)
-- 		bind("a", "%", "Create a new file")
-- 		bind("r", "R", "Rename file/directory")
-- 		bind("d", "D", "Delete file/directory")
-- 		bind("c", "mc", "Copy marked file")
-- 		bind("m", "mm", "Move marked file")
--
-- 		-- Close Netrw easily
-- 		bind("q", ":bd<CR>", "Close Netrw")
--
-- 		-- Fix window navigation if you use Ctrl+l to move right
-- 		vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = true, silent = true })
-- 	end,
-- })
