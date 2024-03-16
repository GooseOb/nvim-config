vim.g.mapleader = ' '

-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>E', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

-- Navigation
vim.keymap.set('n', '<a-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<a-up>', ':wincmd k<CR>')
vim.keymap.set('n', '<a-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<a-down>', ':wincmd j<CR>')
vim.keymap.set('n', '<a-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<a-left>', ':wincmd h<CR>')
vim.keymap.set('n', '<a-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<a-right>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')

-- Splits
vim.keymap.set('n', '|', ':v tsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Other
vim.keymap.set('i', '<c-s>', '<cmd>:w<CR>')
vim.keymap.set('n', '<c-s>', ':w<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>q', ':bd<CR>')
vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>')
vim.api.nvim_set_keymap('t', '<c-w>', '<c-\\><c-n>', { noremap = true, silent = true })
