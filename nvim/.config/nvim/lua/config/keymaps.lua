local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without updating the registers
--
-- Delete a single character without overwriting the default register
keymap.set("n", "x", '"_x', { desc = "Delete character into black hole register" })

-- Paste from the yank register (prevents deleted text from overwriting what you just yanked)
keymap.set("n", "<leader>p", '"0p', { desc = "Paste last yanked text below" })
keymap.set("n", "<leader>P", '"0P', { desc = "Paste last yanked text above" })
keymap.set("v", "<leader>p", '"0p', { desc = "Paste last yanked text over selection" })

-- Change text without overwriting the default register
keymap.set("n", "<leader>c", '"_c', { desc = "Change motion into black hole register" })
keymap.set("n", "<leader>C", '"_C', { desc = "Change to end of line into black hole register" })
keymap.set("v", "<leader>c", '"_c', { desc = "Change selection into black hole register" })
keymap.set("v", "<leader>C", '"_C', { desc = "Change selection into black hole register" })

-- Delete text without overwriting the default register
keymap.set("n", "<leader>d", '"_d', { desc = "Delete motion into black hole register" })
keymap.set("n", "<leader>D", '"_D', { desc = "Delete to end of line into black hole register" })
keymap.set("v", "<leader>d", '"_d', { desc = "Delete selection into black hole register" })
keymap.set("v", "<leader>D", '"_D', { desc = "Delete selection into black hole register" })

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "db", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap.set("n", "o", "o<Esc>^Da", opts)
keymap.set("n", "O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<CR>")
keymap.set("n", "<tab>", ":tabnext<CR>", opts)
keymap.set("n", "<s-tab>", ":tabprev<CR>", opts)
-- Split window
keymap.set("n", "<leader>ss", ":split<Return>", opts)
keymap.set("n", "<leader>sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

-- Toggle inlay hints
keymap.set("n", "<leader>i", function()
	require("lsp").toggleInlayHints()
end)

-- Yank current file path
keymap.set("n", "<leader>yf", function()
	require("utils.editor").yank_relative_path_with_line()
end, { desc = "Yank relative path with line number" })

keymap.set("n", "<leader>yp", function()
	require("utils.editor").yank_absolute_path_with_line()
end, { desc = "Yank absolute path with line number" })

keymap.set("v", "<leader>cc", ":<C-u>lua require('utils.editor').copy_as_codeblock()<CR>")

keymap.set("n", "<leader>j", function()
	require("utils.editor").open_package_json()
end, { desc = "Open package.json in floating window" })

keymap.set("n", "<leader>bd", function()
	require("utils.editor").delete_hidden_buffers()
end, { desc = "Delete hidden buffers" })
