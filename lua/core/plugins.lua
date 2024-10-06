local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Snippets
	{ "hrsh7th/vim-vsnip" },
	{ "hrsh7th/vim-vsnip-integ" },
	-- File tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
	},
	{ "windwp/nvim-ts-autotag" }, -- Auto close tags
	-- LSP
	{ "neovim/nvim-lspconfig" },
	{ "jose-elias-alvarez/null-ls.nvim" }, -- archived, but still works
	-- Color schemes
	{ "joshdick/onedark.vim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rebelot/kanagawa.nvim", lazy = false },
	-- Completion
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	{ "zbirenbaum/copilot-cmp" },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	-- Git
	{ "lewis6991/gitsigns.nvim" },
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
	},
	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		cmd = "ToggleTerm",
	},
	-- File icons
	{ "onsails/lspkind.nvim" },
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Buffer line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Other
	{ "folke/which-key.nvim" },
	{
		"terrortylor/nvim-comment",
		keys = { "gc", "gcc", "gbc" },
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},
})
