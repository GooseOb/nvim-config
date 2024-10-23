local wk = require("which-key")

wk.add({
	{ "<leader>/", desc = "Comment" },
	{ "<leader>e", desc = "File Manager" },
	{ "<leader>h", desc = "No highlight" },
	{ "<leader>o", desc = "Git Status" },
	{ "<leader>w", desc = "Save" },
	{ "<leader>q", desc = "Close Current Buffer" },

	{ "<leader>f", group = "Find" },
	{ "<leader>fb", desc = "Find Buffer" },
	{ "<leader>ff", desc = "Find File" },
	{ "<leader>fh", desc = "Find Help" },
	{ "<leader>fw", desc = "Find Text" },

	{ "<leader>g", group = "Git" },
	{ "<leader>gb", desc = "Branches" },
	{ "<leader>gc", desc = "Commits" },
	{ "<leader>gs", desc = "Status" },

	{ "<leader>l", group = "LSP" },
	{ "<leader>lD", desc = "Hover diagnostic" },
	{ "<leader>la", desc = "Action" },
	{ "<leader>ld", desc = "Diagnostic" },
	{ "<leader>lf", desc = "Format" },
	{ "<leader>lr", desc = "Rename" },
	{ "<leader>ls", desc = "Symbol" },
}, { prefix = "<leader>" })
