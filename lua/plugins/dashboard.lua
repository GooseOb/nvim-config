local header = require("ascii").art.text.neovim.sharp
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
			item("󰁗", "Plugins", "p", ":Lazy"),
			item("󰅚", "Quit", "q", ":q"),
		},
	},
})
