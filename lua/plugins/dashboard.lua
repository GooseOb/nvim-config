return {
	"nvimdev/dashboard-nvim",
	lazy = #vim.v.argv > 2,
	cmd = "Dashboard",
	dependencies = {
		{
			"MaximilianLloyd/ascii.nvim",
			dependencies = "MunifTanjim/nui.nvim",
		},
	},
	config = function()
		local header = require("ascii.text.neovim").sharp
		table.insert(header, "")
		table.insert(header, "")
		table.insert(header, "")

		local function item(icon, desc, key, action)
			return { icon = icon .. "  ", desc = desc, key = key, action = action }
		end

		require("dashboard").setup({
			theme = "doom",
			config = {
				header = header,
				center = {
					item("󰈙", "Find File                  ", "f", ":Telescope find_files"),
					item("󰉔", "Recent Files", "r", ":Telescope oldfiles"),
					item("󰅱", "Config", "c", ":edit ~/.config/nvim/init.lua"),
					item("󰁗", "Lazy", "l", ":Lazy"),
					item("󰅚", "Quit", "q", ":q"),
				},
			},
		})
	end,
}
