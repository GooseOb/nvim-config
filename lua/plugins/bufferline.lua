return {
	"akinsho/bufferline.nvim",
	version = "*",
	keys = {
		{ "<leader>x", ":BufferLinePickClose<CR>" },
		{ "<leader>q", ":bp | bd #<CR>" },
		{ "<s-Tab>", ":bp<CR>" },
		{ "<Tab>", ":bn<CR>" },
	},
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
