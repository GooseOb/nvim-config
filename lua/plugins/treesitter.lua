require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"html",
		"css",
		"scss",
		"vue",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"yaml",
		"toml",
		"bash",
		"markdown",
		"rust",
	},

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
	},
})
