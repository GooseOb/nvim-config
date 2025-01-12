vim.keymap.set({ "n", "t" }, "<c-\\>", "<cmd>:ToggleTerm direction=vertical size=50<CR>")

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	cmd = "ToggleTerm",
}
