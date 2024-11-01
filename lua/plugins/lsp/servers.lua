local masonPackagesPath = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/"

return {
	{ "ts_ls" },
	{ "cssls" },
	{ "clangd" },
	{ "emmet_ls" },
	{ "jdtls" },
	{ "html" },
	{
		"rust_analyzer",
		{
			settings = {
				["rust-analyzer"] = {
					diagnostics = {
						enable = true,
						experimental = {
							enable = true,
						},
					},
				},
			},
		},
	},
	{
		"bashls",
		{
			filetypes = { "sh", "bash", "zsh" },
		},
	},
	{
		"lua_ls",
		{
			settings = {
				Lua = {
					telemetry = {
						enable = false,
					},
					diagnostics = {
						globals = {
							"vim",
						},
					},
				},
			},
		},
	},
	{
		"volar",
		{
			filetypes = {
				"vue",
			},
			init_options = {
				typescript = {
					tsdk = masonPackagesPath .. "/vue-language-server/node_modules/typescript/lib",
				},
				vue = {
					hybridMode = false,
				},
			},
		},
	},
}
