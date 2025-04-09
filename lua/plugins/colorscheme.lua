return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	opts = {
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
	},
	init = function()
		require("kanagawa").load("wave")
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
	end,
}
