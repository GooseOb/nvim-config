local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.eslint_d.with({
			filetypes = {
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
			},
		}),
		null_ls.builtins.diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
			end,
		}),
		null_ls.builtins.formatting.lua_format,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.ltrs,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"css",
				"vue",
				"javascript",
				"typescript",
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
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
