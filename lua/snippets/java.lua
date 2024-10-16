local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function get_class_name()
	local line_count = vim.api.nvim_buf_line_count(0)
	for i = 1, line_count do
		local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
		local class_name = line:match("class%s+([%w_]+)")
		if class_name then
			return class_name
		end
	end
	-- Fallback
	return "ClassName"
end

local java = {
	s("constructor", {
		t("public "),
		f(get_class_name, {}),
		t("("),
		i(1, ""),
		t({ ") {", "\t" }),
		i(2, ""),
		t({ "", "}" }),
	}),
}

ls.add_snippets("java", java)
