return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	keys = {
		{ "<leader>fr", ":Telescope resume<CR>" },
		{ "<leader>.", ":Telescope find_files<CR>" },
		{ "<leader>w", ":Telescope live_grep<CR>" },
		{ "<leader>fh", ":Telescope help_tags<CR>" },
		{ "<leader>gb", ":Telescope git_branches<CR>" },
		{ "<leader>gc", ":Telescope git_commits<CR>" },
		{ "<leader>gs", ":Telescope git_status<CR>" },
		{ "<leader>ls", ":Telescope lsp_document_symbols<CR>" },
		{ "gr", ":Telescope lsp_references<CR>" },
		{ "gd", ":Telescope lsp_definitions<CR>" },
		{ "<leader><Tab>", require("plugins.telescope.searchbuf") },
	},
	dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "top" },
		},
	},
}
