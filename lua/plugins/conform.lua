local is_prettier_config_in_root = function()
	local root = vim.fn.getcwd()
	local prettier_config_files = {
		".prettierrc",
		".prettierrc.json",
		".prettierrc.yml",
		".prettierrc.yaml",
		".prettierrc.toml",
		".prettierrc.js",
		".prettierrc.cjs",
		"prettier.config.js",
		"prettier.config.cjs",
	}
	for _, file in ipairs(prettier_config_files) do
		if vim.fn.filereadable(root .. "/" .. file) == 1 then
			return true
		end
	end
end

return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	event = "BufReadPost",
	config = function()
		require("conform").setup({
			formatters_by_ft = require("utils.swap").merge({
				lua = { "stylua" },
				rust = { "rustfmt" },
				java = { "google-java-format" },
			}, {
				black = {
					"python",
				},
				biome = {
					"json",
					"javascript",
					"typescript",
					"css",
					"javascriptreact",
					"typescriptreact",
					"markdown",
				},
				prettier = {
					"css",
					"vue",
					"svelte",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"scss",
					"less",
					"html",
					"json",
					"jsonc",
					"yaml",
					"markdown",
					"markdown.mdx",
					"graphql",
					"handlebars",
				},
				shfmt = {
					"sh",
					"zsh",
					"bash",
				},
			}),
			-- format_on_save = {
			-- 	timeout_ms = 1000,
			-- 	lsp_format = "fallback",
			-- },
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({})
				if is_prettier_config_in_root() then
					print("Using Prettier config in root")
					require("conform").format({
						bufnr = args.buf,
						async = true,
						formatters = { "prettier" },
						lsp_fallback = true,
					})
				else
					print("Using default formatters")
					require("conform").format({
						bufnr = args.buf,
						async = true,
						lsp_fallback = true,
					})
				end
			end,
		})
	end,
}
