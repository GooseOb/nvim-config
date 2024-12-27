vim.api.nvim_set_hl(0, "CopilotIcon", {
	link = "lualine_c_copilot_enabled_normal",
})

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
		enabled = function()
			if vim.api.nvim_win_get_config(0).relative ~= "" then
				return false
			end
			return true
		end,
		keymap = {
			preset = "default",
			["<Up>"] = { "select_prev", "fallback" },
			["<s-Tab>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			cmdline = {
				preset = "enter",
				["<Tab>"] = { "accept", "fallback" },
				["<CR>"] = { "fallback" },
			},
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
			cmdline = { "cmdline", "path" },
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			menu = {
				auto_show = function()
					return vim.bo.buftype ~= "prompt"
						and vim.b.completion ~= false
						and vim.bo.filetype ~= "TelescopePrompt"
				end,
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr then
										icon = color_item.abbr
									end
								end
								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local group = "BlinkCmpKind" .. ctx.kind
								if ctx.item.source_name == "copilot" then
									group = "CopilotIcon"
								end
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr_hl_group then
										group = color_item.abbr_hl_group
									end
								end
								return group
							end,
						},
					},
				},
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
	init = function()
		vim.api.nvim_set_hl(0, "BlinkCmpMenu", {
			link = "Normal",
		})
	end,
	opts_extend = { "sources.default" },
}
