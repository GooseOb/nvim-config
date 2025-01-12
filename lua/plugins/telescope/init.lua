require("plugins.telescope.mappings")

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "top" },
		},
	},
}
