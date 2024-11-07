require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = { prompt_position = "top" },
	},
})

require("plugins.telescope.mappings")
