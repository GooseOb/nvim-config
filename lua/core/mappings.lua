vim.g.mapleader = " "

local s = vim.keymap.set

-- Navigation
local all_modes = { "n", "i", "v", "x", "s", "o", "t" }
s(all_modes, "<a-up>", "<cmd>:wincmd k<CR>")
s(all_modes, "<a-down>", "<cmd>:wincmd j<CR>")
s(all_modes, "<a-left>", "<cmd>:wincmd h<CR>")
s(all_modes, "<a-right>", "<cmd>:wincmd l<CR>")

-- Splits
s("n", "|", ":vsplit<CR>")
s("n", "\\", ":split<CR>")
s("n", "-", "<cmd>:vertical resize -2<CR>")
s("n", "=", "<cmd>:vertical resize +2<CR>")
s("n", "_", "<cmd>:resize -1<CR>")
s("n", "+", "<cmd>:resize +1<CR>")

-- Tabs
s("n", "<s-Tab>", ":bp<CR>")
s("n", "<Tab>", ":bn<CR>")

-- Terminal
s({ "n", "t" }, "<a-t>", "<cmd>:ToggleTerm direction=vertical size=50<CR>")
-- Escape terminal
s("t", "<esc><esc>", "<C-\\><C-n>")

-- Enter select mode from insert mode
-- not sure if this is useful
s("i", "<S-Left>", "<esc>gh")
s("i", "<S-Right>", "<esc><Right>gh")
s("i", "<S-Down>", "<esc><Right>gh<Down>")
s("i", "<S-Up>", "<esc>gh<Up>")

-- Command shortcuts
s("n", "gs", ":Gitsigns")

-- Other
s({ "n", "v" }, "<leader>/", ":CommentToggle<CR>")

s({ "n", "i" }, "<c-s>", "<cmd>:w<CR>")

s("n", "<leader>q", ":bp | bd #<CR>")
s("n", "<leader>h", ":nohlsearch<CR>")

s("i", "<c-d>", "<c-o>dd")

s("n", "<leader>x", ":BufferLinePickClose<CR>")

_G.ReplaceWithYank = function()
	vim.cmd('normal! `[v`]"_dP')
end

s("n", "r", ":set opfunc=v:lua.ReplaceWithYank<CR>g@")
