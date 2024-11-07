local s = vim.keymap.set

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
s("n", "<leader>lD", vim.diagnostic.open_float)
s("n", "[d", vim.diagnostic.goto_prev)
s("n", "]d", vim.diagnostic.goto_next)
s("n", "<leader>ld", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		s("n", "gD", vim.lsp.buf.declaration, opts)
		s("n", "K", vim.lsp.buf.hover, opts)
		s("n", "gi", vim.lsp.buf.implementation, opts)
		s("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		-- s('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
		-- s('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
		--                opts)
		-- s('n', '<Leader>sl', function()
		--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		-- s('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
		s("n", "<Leader>lr", vim.lsp.buf.rename, opts)
		s({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
		-- s('n', 'gr', vim.lsp.buf.references, opts)
		s("n", "<Leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
