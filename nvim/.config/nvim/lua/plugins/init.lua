gh = function(x)
	return "https://github.com/" .. x
end

vim.pack.add({
	-- UI
	{ src = gh("RRethy/base16-nvim") },
	{ src = gh("nvim-mini/mini.icons") },
	{ src = gh("folke/snacks.nvim") },
	{ src = gh("folke/trouble.nvim") },
	{ src = gh("nvim-lualine/lualine.nvim") },
	{ src = gh("esmuellert/codediff.nvim") },
	{ src = gh("rachartier/tiny-cmdline.nvim") },
	{ src = gh("akinsho/bufferline.nvim") },
	-- Editor
	{ src = gh("folke/which-key.nvim") },
	{ src = gh("stevearc/conform.nvim") },
	{ src = gh("nvim-treesitter/nvim-treesitter") },
	{ src = gh("mks-h/treesitter-autoinstall.nvim") },
	{ src = gh("nvim-mini/mini.pairs") },
	{ src = gh("craftzdog/mini.diff"), version = "feat/grouping" },
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("^1") },
	{ src = gh("fang2hou/blink-copilot") },
	{ src = gh("rafamadriz/friendly-snippets") },
	{ src = gh("folke/todo-comments.nvim") },
	{ src = gh("lewis6991/gitsigns.nvim") },
	{ src = gh("linrongbin16/gitlinker.nvim") },
	{ src = gh("brenoprata10/nvim-highlight-colors") },
	-- LSP
	{ src = gh("neovim/nvim-lspconfig") },

	{ src = gh("mason-org/mason.nvim") },
	{ src = gh("WhoIsSethDaniel/mason-tool-installer.nvim") },
	-- Util
	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("zbirenbaum/copilot.lua") },
	{ src = gh("fang2hou/blink-copilot") },
})

if #vim.api.nvim_get_runtime_file("lua/plugins/local.lua", false) > 0 then
	require("plugins.local")
end

require("plugins.colorscheme")
require("plugins.bufferline")
require("plugins.ui")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.editor")
require("plugins.lsp")
require("plugins.util")
require("plugins.keymaps")
