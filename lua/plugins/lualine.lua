return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
	event = "BufReadPost",
	config = function()
		require("lualine").setup({
			options = {
				theme = require("colorschemes.kanagawa").lualine_theme(),
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
					},
				},
				lualine_c = {
					{ "copilot", show_colors = true },
					"filename",
				},
				lualine_x = {},
				lualine_y = { "encoding", "fileformat", "filetype", "progress" },
				lualine_z = {
					"location",
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
