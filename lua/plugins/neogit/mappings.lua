local s = vim.keymap.set

s("n", "g<leader>", ":Neogit<CR>")
s("n", "<leader>gp", ":Neogit pull<CR>")
s("n", "<leader>gP", ":Neogit push<CR>")
