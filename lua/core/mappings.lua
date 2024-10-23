vim.g.mapleader = " "

local s = vim.keymap.set

-- NeoTree
s("n", "<leader>e", ":Neotree float reveal<CR>")
s("n", "<leader>E", ":Neotree left reveal<CR>")
s("n", "<leader>o", ":Neotree float git_status<CR>")

-- Navigation
local all_modes = { "n", "i", "v", "x", "s", "o", "t" }
s(all_modes, "<a-up>", "<cmd>:wincmd k<CR>")
s(all_modes, "<a-down>", "<cmd>:wincmd j<CR>")
s(all_modes, "<a-left>", "<cmd>:wincmd h<CR>")
s(all_modes, "<a-right>", "<cmd>:wincmd l<CR>")

-- Splits
s("n", "|", ":vsplit<CR>")
s("n", "\\", ":split<CR>")

-- Tabs
s("n", "<Tab>", ":BufferLineCycleNext<CR>")
s("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")

-- Terminal
s({ "n", "t" }, "<a-t>", "<cmd>:ToggleTerm direction=vertical size=50<CR>")
-- Escape terminal
s("t", "<esc>", "<C-\\><C-n>")

-- Command shortcuts
s("n", "gs", ":Gitsigns")

-- Other
s({ "n", "v" }, "<leader>/", ":CommentToggle<CR>")

s("n", "<a-v>", "ggVG")

s({ "n", "i" }, "<c-s>", "<cmd>:w<CR>")

s("n", "<leader>q", ":bp | bd #<CR>")
s("n", "<leader>h", ":nohlsearch<CR>")

require("snippets.mappings")
