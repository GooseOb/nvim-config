local s = vim.keymap.set

s("n", "<leader>x", ":BufferLinePickClose<CR>")
s("n", "<leader>q", ":bp | bd #<CR>")
s("n", "<s-Tab>", ":bp<CR>")
s("n", "<Tab>", ":bn<CR>")

return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {
		options = {
			style_preset = 4, -- no italics
			show_buffer_close_icons = false,
			show_close_icon = false,
			always_show_bufferline = false,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
