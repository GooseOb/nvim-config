local M = {}

M.plugin = {
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
	end,
}

M.lualine_theme = function()
	local theme = require("lualine.themes.kanagawa")
	for _, mode_theme in pairs(theme) do
		if mode_theme.c then
			mode_theme.c.bg = "NONE"
		end
	end
	return theme
end

return M
