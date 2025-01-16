vim.keymap.set({ "n", "t" }, "<c-\\>", "<cmd>:ToggleTerm<CR>")

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = "ToggleTerm",
	opts = {
		direction = "vertical",
		size = 50,
	},
}
