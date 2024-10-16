local map_mut = require("helpers.map_mut")
local slice = require("helpers.slice")
local cap_first = require("helpers.cap_first")

local function get_java_filenames(type, directory)
	local files = vim.fn.glob(directory .. "/*.java", true, true)

	local filenames = {}

	local opposite_type = type == "class" and "interface" or "class"

	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		local content = vim.fn.readfile(file)
		for _, line in ipairs(content) do
			if line:find(type) then
				table.insert(filenames, filename)
				break
			elseif line:find(opposite_type) then
				break
			end
		end
	end

	return filenames
end

vim.api.nvim_create_user_command("JavaCreate", function(opts)
	local args = vim.split(opts.args, " ")
	local prefix, name = args[1], args[2]
	local extends = (args[3] and args[3] ~= "-") and " extends " .. cap_first(args[3]) or ""
	local implements = #args > 3 and " implements " .. table.concat(map_mut(slice(args, 4), cap_first), ", ") or ""
	vim.cmd.edit(name .. ".java")
	local lines = {
		"public " .. prefix:lower() .. " " .. name .. extends .. implements .. " {",
		"\t",
		"}",
	}
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	vim.cmd.startinsert()
	vim.api.nvim_win_set_cursor(0, { 2, #lines[2] })
end, {
	nargs = "+",
	complete = function(arg_lead, cmdline)
		local matches = {}
		local arg_num = #vim.split(cmdline, " ")

		if arg_num == 2 then
			for _, class in ipairs({
				"class",
				"interface",
			}) do
				if class:lower():find(arg_lead:lower(), 1, true) then
					table.insert(matches, class)
				end
			end
		elseif arg_num > 3 then
			local type = arg_num == 4 and "class" or "interface"
			for _, class in ipairs(get_java_filenames(type, vim.fn.getcwd())) do
				if class:lower():find(arg_lead:lower(), 1, true) then
					table.insert(matches, class)
				end
			end
		end

		return matches
	end,
})
