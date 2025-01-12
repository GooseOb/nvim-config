vim.keymap.set("n", "gs", ":Gitsigns")

return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
	config = true,
}
