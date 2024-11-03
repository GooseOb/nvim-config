require("kanagawa").setup({
	compile = true,
	keywordStyle = { italic = false },
	commentStyle = { italic = false },
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	transparent = true,
})

vim.cmd.colorscheme("kanagawa-wave")

