require("mason").setup()

local mason_registry = require("mason-registry")

local function ensure_installed(packages)
	for _, package in ipairs(packages) do
		local p = mason_registry.get_package(package)
		if not p:is_installed() then
			p:install()
		end
	end
end

ensure_installed({
	"bash-language-server",
	"clangd",
	"emmet-ls",
	"eslint_d",
	"google-java-format",
	"html-lsp",
	"css-lsp",
	"jdtls",
	"lua-language-server",
	"prettier",
	-- "prettierd",
	"rust-analyzer",
	"stylua",
	"typescript-language-server",
	"vue-language-server",
})
