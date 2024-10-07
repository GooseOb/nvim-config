vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
require("neo-tree").setup({
	event_handlers = {
		{
			event = "file_deleted",
			handler = function(file_path)
				if vim.fn.filereadable(file_path) == 0 then
					local is_tracked = vim.fn.systemlist("git ls-files " .. file_path)[1]
					if is_tracked then
						vim.fn.system("git rm " .. file_path)
						print("Staged deleted file: " .. file_path)
					end
				end
			end,
		},
	},
})
