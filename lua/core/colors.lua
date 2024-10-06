vim.opt.termguicolors = true

function SetColor(color)
	vim.cmd.colorscheme(color)

	if color == "onedark" then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		require("helpers.treesitter-migrate")
	end
end

SetColor("kanagawa-dragon")
