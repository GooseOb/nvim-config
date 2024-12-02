require("plugins.neotree.mappings")

return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		local recursive_open = require("plugins.neotree.recursive-open")

		require("neo-tree").setup({
			popup_border_style = "rounded",
			filesystem = {
				window = {
					mappings = {
						["Z"] = function(state)
							recursive_open(state, state.tree:get_node(), 10)
						end,
					},
				},
			},
		})

		vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "NONE", fg = "#938AA9" })
		vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "NONE", fg = "#938AA9" })
	end,
}
