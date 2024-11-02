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
	"shfmt",
	"clangd",
	"rust-analyzer",
	"eslint_d",
	"emmet-ls",
	"html-lsp",
	"css-lsp",
	"prettier",
	-- "prettierd",
	"typescript-language-server",
	"vue-language-server",
	"jdtls",
	"google-java-format",
	"lua-language-server",
	"stylua",
})
