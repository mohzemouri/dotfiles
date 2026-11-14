-- Completion
---@module 'blink.cmp'
---@type blink.cmp.Config

local icons = require("utils.icons")
require("blink.cmp").setup({
	snippets = {
		preset = "default",
	},
	completion = {
		accept = {
			-- experimental auto-brackets support
			auto_brackets = {
				enabled = true,
			},
		},
		menu = {
			border = "rounded",
			draw = {
				treesitter = { "lsp" },
				columns = {
					{ "kind_icon" },
					{ "label", "label_description", gap = 1 },
					{ "source_name" },
				},
				components = {
					source_name = {
						width = { max = 30 },
						text = function(ctx)
							if ctx.source_name == "LSP" and ctx.item.client_name then
								return "[" .. ctx.item.client_name .. "]"
							end
							return "[" .. ctx.source_name .. "]"
						end,
						highlight = "BlinkCmpSource",
					},
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		ghost_text = {
			-- TODO: Specify AI completion
			enabled = vim.g.ai_cmp,
		},
	},

	sources = {
		-- adding any nvim-cmp sources here will enable them
		-- with blink.compat
		-- compat = {},
		default = { "lsp", "path", "snippets", "buffer", "cmdline", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100, -- Forces copilot items to rank higher up the list
				async = true,
				opts = {
					max_completions = 3,
				},
			},
		},
	},

	cmdline = {
		enabled = true,
		keymap = {
			preset = "cmdline",
			["<Right>"] = false,
			["<Left>"] = false,
		},
		completion = {
			list = { selection = { preselect = false } },
			menu = {
				auto_show = function(ctx)
					return vim.fn.getcmdtype() == ":"
				end,
			},
			ghost_text = { enabled = true },
		},
	},

	keymap = {
		preset = "enter",
		["<C-l>"] = { "select_and_accept", "fallback" },
		["<C-e>"] = { "hide" },
		["<C-n>"] = { "select_next" },
		["<C-p>"] = { "select_prev" },
		["<C-d>"] = { "scroll_documentation_down", args = { direction = "down" } },
		["<C-u>"] = { "scroll_documentation_up", args = { direction = "up" } },
		["<C-x>"] = { "show", "show_documentation", "hide_documentation" },
	},

	appearance = {
		kind_icons = icons.kinds,
	},
})

require("mini.pairs").setup({
	modes = { insert = true, command = true, terminal = false },
})

require("mini.diff").setup({
	view = {
		-- show whole reference part above whole buffer part, as in `git diff`
		overlay_style = "hunk",
	},
	mappings = {
		-- same keymaps as codediff.nvim
		goto_next = "]c",
		goto_prev = "[c",
	},
})
-- Comments
require("todo-comments").setup()

-- Git integration
require("gitsigns").setup()
require("gitlinker").setup()

-- Formatting
local oxfmtFormatter = { "oxfmt", "prettierd", "prettier", stop_after_first = true }
require("conform").setup({
	default_format_opts = {
		timeout_ms = 3000,
		async = false,
		quiet = false,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		javascript = oxfmtFormatter,
		typescript = oxfmtFormatter,
		javascriptreact = oxfmtFormatter,
		typescriptreact = oxfmtFormatter,
		json = oxfmtFormatter,
		css = oxfmtFormatter,
		html = oxfmtFormatter,
		markdown = oxfmtFormatter,
		yaml = oxfmtFormatter,
		less = oxfmtFormatter,
		scss = oxfmtFormatter,
		["markdown.mdx"] = oxfmtFormatter,
		lua = { "stylua" },
		sh = { "shfmt" },
		fish = { "fish_indent" },
	},
	formatters = {
		oxfmt = {
			-- Treat oxfmt as available only when the project has an oxfmt config
			-- (.oxfmtrc.json / .oxfmtrc.jsonc). Without it, oxfmt is skipped and the
			-- formatter list falls back to prettier.
			require_cwd = true,
		},
	},
	format_on_save = function(bufnr)
		if vim.b[bufnr].disable_autoformat then
			return
		end
		return {
			timeout_ms = 500,
			lsp_fallback = true,
		}
	end,
})

-- Colors
vim.lsp.document_color.enable(false)
require("nvim-highlight-colors").setup({
	render = "background",
	enable_hex = true,
	enable_short_hex = true,
	enable_rgb = true,
	enable_hsl = true,
	enable_hsl_without_function = true,
	enable_ansi = true,
	enable_var_usage = true,
	enable_tailwind = false,
})

-- Which-key
-- 1. Setup which-key with the "helix" preset
local status_ok, wk = pcall(require, "which-key")
if status_ok then
	wk.setup({
		preset = "helix", -- options: "classic", "modern", "helix"
		-- Your custom configuration goes here
	})

	-- 2. Register your group descriptions using the modern .add() method
	wk.add({

		mode = { "n", "x" },
		{ "<leader><tab>", group = "tabs" },
		{ "<leader>c", group = "Code / LSP" },
		{ "<leader>d", group = "debug" },
		{ "<leader>dp", group = "profiler" },
		{ "<leader>f", group = "file/find" },
		{ "<leader>g", group = "git" },
		{ "<leader>gh", group = "hunks" },
		{ "<leader>cd", group = "codediff" },
		{ "<leader>q", group = "quit/session" },
		{ "<leader>s", group = "search" },
		{ "<leader>u", group = "ui" },
		{ "<leader>x", group = "diagnostics/quickfix" },
		{ "[", group = "prev" },
		{ "]", group = "next" },
		{ "g", group = "goto" },
		{ "gs", group = "surround" },
		{ "z", group = "fold" },
		{
			"<leader>b",
			group = "buffer",
			expand = function()
				return require("which-key.extras").expand.buf()
			end,
		},
		{
			"<leader>w",
			group = "windows",
			proxy = "<c-w>",
			expand = function()
				return require("which-key.extras").expand.win()
			end,
		},
		-- better descriptions
		{ "gx", desc = "Open with system app" },
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	})
end
