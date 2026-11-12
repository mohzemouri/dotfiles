---@type vim.lsp.Config
return {
	init_options = {
		showSuggestionsAsSnippets = true,
	},
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = {
		"astro",
		"css",
		"eruby",
		"html",
		"htmlangular",
		"htmldjango",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"svelte",
		"typescriptreact",
		"vue",
	},
	root_markers = { ".git" },
}
