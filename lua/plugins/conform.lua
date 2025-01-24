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
				prettier = {
					"css",
					"vue",
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
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
