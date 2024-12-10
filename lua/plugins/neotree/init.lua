require("plugins.neotree.mappings")

local is_directory = function(path)
	local stat = vim.loop.fs_stat(path)
	return stat and stat.type == "directory"
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	lazy = #vim.v.argv < 3 or not is_directory(vim.v.argv[3]),
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

		require("neo-tree").setup({
			popup_border_style = "rounded",
		})

		vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "NONE", fg = "#938AA9" })
		vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "NONE", fg = "#938AA9" })
	end,
}
