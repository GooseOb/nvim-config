local s = vim.keymap.set

s("n", "<leader>r", ":Telescope resume<CR>")
s("n", "<leader>.", ":Telescope find_files<CR>")
s("n", "<leader>w", ":Telescope live_grep<CR>")
s("n", "<leader>fh", ":Telescope help_tags<CR>")
s("n", "<leader>gb", ":Telescope git_branches<CR>")
s("n", "<leader>gc", ":Telescope git_commits<CR>")
s("n", "<leader>gs", ":Telescope git_status<CR>")
s("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>")
s("n", "gr", ":Telescope lsp_references<CR>")
s("n", "gd", ":Telescope lsp_definitions<CR>")
s("n", "<leader><Tab>", ":Telescope buffers<CR>")
