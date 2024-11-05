local data_path = vim.fn.stdpath("data")
local mason_packages_path = data_path .. "/mason/packages"

return {
	{ "ts_ls" },
	{ "cssls" },
	{ "clangd" },
	{ "emmet_ls" },
	{
		"jdtls",
		{
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.level=ALL",
				"-Xms1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				vim.fn.glob(mason_packages_path .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
				"-configuration",
				mason_packages_path
					.. "/jdtls/config_"
					.. (vim.loop.os_uname().sysname == "Darwin" and "mac" or "linux"),
				"-data",
				data_path .. "/jdtls-workspaces/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
			},
		},
	},
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
					tsdk = mason_packages_path .. "/vue-language-server/node_modules/typescript/lib",
				},
				vue = {
					hybridMode = false,
				},
			},
		},
	},
}
