local formatters_by_ft = {
	lua = { "stylua" },
	rust = { "rustfmt" },
	java = { "google-java-format" },
}

local ft_by_formatter = {
	prettier = {
		"css",
		"vue",
		"javascript",
		"typescript",
		"scss",
		"less",
		"html",
		"json",
		"jsonc",
		"yaml",
		"markdown",
		"markdown.mdx",
		"graphql",
		"handlebars",
	},
}

for formatter, fts in pairs(ft_by_formatter) do
	local formatters = { formatter }
	for _, ft in ipairs(fts) do
		formatters_by_ft[ft] = formatters
	end
end

require("conform").setup({
	formatters_by_ft = formatters_by_ft,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
