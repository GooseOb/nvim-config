vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
require("neo-tree").setup({
	window = {
		mappings = {
			["d"] = function(state)
				local path = state.tree:get_node().path
				local confirm = vim.fn.input("Are you sure you want to delete '" .. path .. "'? (y/n): ")
				if confirm:lower() == "y" then
					local is_tracked = vim.fn.systemlist("git ls-files " .. path)[1]
					if is_tracked then
						vim.fn.system("git rm -f " .. path)
						print("Staged deleted file: " .. path)
					else
						vim.fn.delete(path)
						print("Deleted file: " .. path)
					end
					require("neo-tree.sources.manager").refresh(state)
				end
			end,
		},
	},
})
