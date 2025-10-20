return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	opts = {
		compile        = true,
		typeStyle      = { bold = false },
		functionStyle  = { bold = false },
		keywordStyle   = { italic = false, bold = false },
		commentStyle   = { italic = false },
		statementStyle = { bold = false },
		colors         = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
		transparent    = true,
		overrides      = function()
			return {
				Boolean = { bold = false },
			}
		end,

	},
	init = function()
		require("kanagawa").load("wave")
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#54546D" })
	end,
}
