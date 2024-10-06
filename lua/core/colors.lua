vim.opt.termguicolors = true

local to_migrate = {
	["onedark"] = true,
}

local to_make_bg_dark = {
	["onedark"] = true,
}

function SetColor(color)
	if string.find(color, "kanagawa") then
		require("kanagawa").setup({
			keywordStyle = { italic = false },
		})
	end

	vim.cmd.colorscheme(color)

	if to_migrate[color] then
		require("helpers.treesitter-migrate")
	end

	if to_make_bg_dark[color] then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	end
end

SetColor("kanagawa-wave")
