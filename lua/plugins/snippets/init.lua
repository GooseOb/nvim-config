return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	event = "InsertEnter",
	dependencies = "saadparwaiz1/cmp_luasnip",
	config = function()
		require("plugins.snippets.java")
		require("plugins.snippets.mappings")
	end,
}
