vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
require("neo-tree").setup({
	popup_border_style = "rounded",
})

vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "NONE", fg = "#938AA9" })
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "NONE", fg = "#938AA9" })
