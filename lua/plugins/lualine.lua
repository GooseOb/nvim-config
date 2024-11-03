local theme = require("lualine.themes.kanagawa")

for _, mode_theme in pairs(theme) do
	if mode_theme.c then
		mode_theme.c.bg = "NONE"
	end
end

require("lualine").setup({
	options = {
		theme = theme,
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
			"filename",
		},
		lualine_x = {
			{
				icon = "#",
				function()
					local prev_bufnr = vim.fn.bufnr("#")
					if prev_bufnr ~= -1 then
						return vim.fn.fnamemodify(vim.fn.bufname(prev_bufnr), ":t")
					else
						return ""
					end
				end,
				color = { fg = "#70757e" },
			},
		},
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
