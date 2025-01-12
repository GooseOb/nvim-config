local function open_dashboard()
	local header = {
		[[                                                                       ]],
		[[                                                                     ]],
		[[       ████ ██████           █████      ██                     ]],
		[[      ███████████             █████                             ]],
		[[      █████████ ███████████████████ ███   ███████████   ]],
		[[     █████████  ███    █████████████ █████ ██████████████   ]],
		[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
		[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
		[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
		[[                                                                       ]],
	}
	local stats = require("lazy").stats()
	local footer = {
		"Startup time: " .. stats.startuptime .. " ms",
		"Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins",
	}

	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

	local padding_top = math.floor((height - (#header + #footer)) / 2)

	local centered_lines = {}
	for _ = 1, padding_top do
		table.insert(centered_lines, "")
	end

	local header_padding_left = math.floor((width - #header[1]) / 2)
	for _, line in ipairs(header) do
		table.insert(centered_lines, string.rep(" ", header_padding_left) .. line)
	end

	table.insert(centered_lines, "")

	for _, line in ipairs(footer) do
		local padding_left = math.floor((width - #line) / 2)
		table.insert(centered_lines, string.rep(" ", padding_left) .. line)
	end

	local buf = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, centered_lines)

	for line_num = 1, #header do
		vim.api.nvim_buf_add_highlight(buf, 0, "DashboardHeader", padding_top + line_num, 0, -1)
	end

	vim.api.nvim_set_current_buf(buf)

	vim.api.nvim_buf_set_option(buf, "filetype", "dashboard")
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_option(buf, "number", false)
	vim.api.nvim_buf_set_option(buf, "relativenumber", false)
	vim.api.nvim_buf_set_option(buf, "cursorline", false)
	vim.api.nvim_buf_set_option(buf, "signcolumn", "no")

	vim.api.nvim_create_autocmd("BufEnter", {
		buffer = buf,
		callback = function(opt)
			vim.api.nvim_buf_delete(buf, { force = true })
			vim.api.nvim_del_autocmd(opt.id)
		end,
	})
end

if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" and vim.g.read_from_stdin == nil then
	vim.api.nvim_create_autocmd("UIEnter", { callback = open_dashboard })
end
