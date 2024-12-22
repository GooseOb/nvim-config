-- TODO: Add nvim-highlight-colors support when it's available
return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"giuxtaposition/blink-cmp-copilot",
	},

	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<Tab>"] = { "accept", "fallback" },
		},

		sources = {
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
					transform_items = function(_, items)
						local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
						local kind_idx = #CompletionItemKind + 1
						CompletionItemKind[kind_idx] = "Copilot"
						for _, item in ipairs(items) do
							item.kind = kind_idx
						end
						return items
					end,
				},
			},
			default = { "lsp", "path", "snippets", "buffer", "copilot" },
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},
		appearance = {
			kind_icons = {
				Copilot = "",
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},
	},
	opts_extend = { "sources.default" },
}
