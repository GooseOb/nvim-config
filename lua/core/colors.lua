vim.opt.termguicolors = true

local function set_color(color)
	local to_migrate = {
		["onedark"] = true,
	}

	local to_make_bg_dark = {
		["onedark"] = true,
	}

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

local function set_kanagawa_wave()
	require("kanagawa").setup({
		compile = true,
		keywordStyle = { italic = false },
		commentStyle = { italic = false },
	})
	vim.cmd.colorscheme("kanagawa-wave")
end

set_kanagawa_wave()
