vim.keymap.set({ "n", "v" }, "<leader>/", ":CommentToggle<CR>")

return {
	"terrortylor/nvim-comment",
	cmd = "CommentToggle",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		require("nvim_comment").setup()
	end,
}
