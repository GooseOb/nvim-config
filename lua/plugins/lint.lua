local eslint = { "eslint_d" }

local lint = require("lint")

lint.linters_by_ft = {
	javascript = eslint,
	typescript = eslint,
	typescriptreact = eslint,
	javascriptreact = eslint,
}

vim.api.nvim_create_autocmd({ "BufRead", "TextChanged" }, {
	callback = function()
		lint.try_lint()
	end,
})
