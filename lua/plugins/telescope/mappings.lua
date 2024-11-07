local builtin = require("telescope.builtin")
local search_buf = require("plugins.telescope.searchbuf")

local s = vim.keymap.set

s("n", "<leader>ff", builtin.find_files)
s("n", "<leader>fw", builtin.live_grep)
s("n", "<leader>fh", builtin.help_tags)
s("n", "<leader>gb", builtin.git_branches)
s("n", "<leader>gc", builtin.git_commits)
s("n", "<leader>gs", builtin.git_status)
s("n", "<leader>ls", builtin.lsp_document_symbols)
s("n", "gr", builtin.lsp_references)
s("n", "gd", builtin.lsp_definitions)
s("n", "<leader>fb", search_buf)
s("n", "<leader><Tab>", search_buf)
