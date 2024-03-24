vim.g.mapleader = " "

-- NeoTree
vim.keymap.set("n", "<leader>e", ":Neotree float reveal<CR>")
vim.keymap.set("n", "<leader>E", ":Neotree left reveal<CR>")
vim.keymap.set("n", "<leader>o", ":Neotree float git_status<CR>")

-- Navigation
vim.keymap.set("n", "<a-up>", ":wincmd k<CR>")
vim.keymap.set("t", "<a-up>", "<cmd>:wincmd k<CR>")

vim.keymap.set("n", "<a-down>", ":wincmd j<CR>")
vim.keymap.set("t", "<a-down>", "<cmd>:wincmd j<CR>")

vim.keymap.set("n", "<a-left>", ":wincmd h<CR>")
vim.keymap.set("t", "<a-left>", "<cmd>:wincmd h<CR>")

vim.keymap.set("n", "<a-right>", ":wincmd l<CR>")
vim.keymap.set("t", "<a-right>", "<cmd>:wincmd l<CR>")

vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")

-- Splits
vim.keymap.set("n", "|", ":v tsplit<CR>")
vim.keymap.set("n", "\\", ":split<CR>")

-- Tabs
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")

-- Terminal
local vertical_term = ":ToggleTerm direction=vertical size=40<CR>"
local primary_term = vertical_term
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
vim.keymap.set("n", "<leader>tv", vertical_term)
vim.keymap.set("n", "<a-t>", primary_term)
vim.keymap.set("t", "<a-t>", "<cmd>" .. primary_term)

-- Command shortcuts
vim.keymap.set("n", "gs", ":Gitsigns")

-- Other
vim.keymap.set("i", "<c-s>", "<cmd>:w<CR>")
vim.keymap.set("n", "<c-s>", ":w<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<leader>X", ":BufferLineCloseRight<CR>")
vim.keymap.set("n", "<leader>s", ":BufferLineSortByTabs<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
