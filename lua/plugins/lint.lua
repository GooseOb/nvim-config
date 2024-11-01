local eslint = { "eslint_d" }

local lint = require("lint")

lint.linters_by_ft = {
	javascript = eslint,
	typescript = eslint,
	typescriptreact = eslint,
	javascriptreact = eslint,
}

lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
	if diagnostic.message:find("Error: Could not find config file") then
		return nil
	end
	return diagnostic
end)

vim.api.nvim_create_autocmd({ "BufRead", "TextChanged" }, {
	callback = function()
		lint.try_lint()
	end,
})
