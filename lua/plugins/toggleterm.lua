vim.keymap.set({ "n", "t" }, "<c-\\>", "<cmd>:ToggleTerm<CR>")

local run = function(cmd)
	local term = nil
	for _, t in pairs(require("toggleterm.terminal").get_all()) do
		if t.id == 1 then
			term = t
			break
		end
	end

	if not term then
		term = require("toggleterm.terminal").Terminal:new({
			id = 1,
			direction = "float",
			close_on_exit = false,
		})
		term:open()
	elseif not term:is_open() then
		term:open()
	end

	term:send(cmd, true)

	vim.defer_fn(function()
		if not term:is_open() then
			term:open()
		end
		vim.api.nvim_set_current_win(term.window)
	end, 100)
end

local function ends_with(str, ending)
	return str:sub(-#ending) == ending
end

local filetype2cmd = {
	typescript = function(path)
		if ends_with(path, ".test.ts") then
			return "bun test"
		else
			return "bun " .. path
		end
	end,
	javascript = function(path)
		return "node " .. path
	end,
	java = function(path)
		return "javac " .. path .. " && java " .. vim.fn.fnamemodify(path, ":t:r")
	end,
}

vim.keymap.set("n", "<a-r>", function()
	local path = vim.api.nvim_buf_get_name(0)
	local cmd = filetype2cmd[vim.bo.filetype]
	run(cmd and cmd(path) or path)
end)

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = "ToggleTerm",
	opts = {
		direction = "vertical",
		size = 50,
	},
}
