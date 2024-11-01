local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local lspconfig = require("lspconfig")

for _, server in ipairs(require("plugins.lsp.servers")) do
	local name = server[1]
	local config = server[2] or {}
	config.capabilities = capabilities
	lspconfig[name].setup(config)
end

require("plugins.lsp.mappings")
