vim.api.nvim_create_user_command("ToggleFormatter", function()
	require("utils.editor").toggle_formatter()
end, { desc = "Toggle formatter for current buffer" })

-- Create a .oxfmtrc.json config file in the current working directory
vim.api.nvim_create_user_command("CreateOxfmtConfig", function()
	local cwd = vim.fn.getcwd()
	local target_file = cwd .. "/.oxfmtrc.json"

	-- Check if the file already exists
	if vim.fn.filereadable(target_file) == 1 then
		vim.notify("✨ .oxfmtrc.json already exists in this project!", vim.log.levels.WARN, { title = "oxfmt" })
		return
	end

	-- Multi-line string block preserves the exact order and formatting
	local json_data = [[{
  "$schema": "https://githubusercontent.com",
  "tabWidth": 2,
  "useTabs": false,
  "semi": true,
  "singleQuote": false,
  "quoteProps": "as-needed",
  "jsxSingleQuote": false,
  "trailingComma": "all",
  "bracketSpacing": true,
  "bracketSameLine": false,
  "arrowParens": "always",
  "printWidth": 80
}]]

	-- Open file, write data, close securely
	local file = io.open(target_file, "w")
	if file then
		file:write(json_data)
		file:close()
		vim.notify("🎉 Created .oxfmtrc.json in project root!", vim.log.levels.INFO, { title = "oxfmt" })
	else
		vim.notify(
			"❌ Failed to create config file. Check directory permissions.",
			vim.log.levels.ERROR,
			{ title = "oxfmt" }
		)
	end
end, { desc = "Generate a standard oxfmt configuration file in the project CWD" })
