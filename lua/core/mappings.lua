vim.g.mapleader = " "

-- NeoTree
vim.keymap.set("n", "<leader>e", ":Neotree float reveal<CR>")
vim.keymap.set("n", "<leader>E", ":Neotree left reveal<CR>")
vim.keymap.set("n", "<leader>o", ":Neotree float git_status<CR>")

-- Navigation
vim.keymap.set({ "n", "t" }, "<a-up>", "<cmd>:wincmd k<CR>")
vim.keymap.set({ "n", "t" }, "<a-down>", "<cmd>:wincmd j<CR>")
vim.keymap.set({ "n", "t" }, "<a-left>", "<cmd>:wincmd h<CR>")
vim.keymap.set({ "n", "t" }, "<a-right>", "<cmd>:wincmd l<CR>")

-- Splits
vim.keymap.set("n", "|", ":v tsplit<CR>")
vim.keymap.set("n", "\\", ":split<CR>")

-- Tabs
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")

-- Terminal
vim.keymap.set({ "n", "t" }, "<a-t>", "<cmd>:ToggleTerm direction=vertical size=50<CR>")
-- Escape terminal
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Command shortcuts
vim.keymap.set("n", "gs", ":Gitsigns")

-- Other
vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")

vim.keymap.set("n", "<a-v>", "ggVG")

vim.keymap.set({ "n", "i" }, "<c-s>", "<cmd>:w<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

vim.keymap.set("n", "<leader>q", ":bp | bd #<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

require("snippets.mappings")
