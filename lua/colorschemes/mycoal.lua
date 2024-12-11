-- Based on: cranberry-clockworks/coal.nvim

vim.api.nvim_command("hi clear")

local colors = {
	smoky_black = "#0C0C0C",
	eerie_black = "#1A1A1A",
	raisin_black = "#262626",

	dark_charcoal = "#303030",
	gray = "#7E7E7E",
	quick_silver = "#A5A5A5",
	chinese_silver = "#CCCCCC",
	anti_flash_white = "#F2F2F2",
	white = "#FFFFFF",
}

local palette = {
	selection = {
		foreground = colors.smoky_black,
		background = colors.anti_flash_white,
	},
	background = {
		medium = colors.smoky_black,
		brighter = colors.eerie_black,
		brightest = colors.raisin_black,
	},
	foreground = {
		darkest = colors.dark_charcoal,
		darker = colors.gray,
		dimmed = colors.quick_silver,
		medium = colors.chinese_silver,
		brighter = colors.anti_flash_white,
		brightest = colors.white,
	},
}

local groups = {
	normal = { fg = palette.foreground.medium, bg = "none" },
	selection = { fg = palette.selection.foreground, bg = palette.selection.background },

	darkest = { fg = palette.foreground.darkest },
	darker = { fg = palette.foreground.darker },
	dimmed = { fg = palette.foreground.dimmed },
	medium = { fg = palette.foreground.medium },
	medium_underline = { fg = palette.foreground.medium, underline = true },
	brighter = { fg = palette.foreground.brighter },
	brightest = { fg = palette.foreground.brightest },
	brightest_bold = { fg = palette.foreground.brightest, bold = true },

	underline = { underline = true },
	bold = { bold = true },
	italic = { italic = true },
}

local higlight_groups = {
	Normal = groups.normal,

	Bold = groups.bold,
	Italic = groups.italic,
	Underlined = groups.underline,

	Visual = groups.selection,

	Directory = groups.brighter,

	IncSearch = groups.selection,
	Search = groups.selection,
	Substitute = groups.selection,

	MatchParen = { fg = palette.foreground.brightest, bg = palette.background.medium },

	ModeMsg = groups.brighter,
	MoreMsg = groups.brighter,
	NonText = { fg = palette.foreground.darkest },

	LineNr = groups.dimmed,
	LineNrAbove = groups.darkest,
	LineNrBelow = groups.darkest,
	CursorLineNr = groups.darker,

	StatusLine = { fg = palette.foreground.medium, bg = palette.background.brighter },
	StatusLineNC = { fg = palette.foreground.darkest, bg = palette.background.brighter },
	WinSeparator = { fg = palette.foreground.darkest, bg = palette.background.medium },
	SignColumn = groups.normal,
	Colorcolumn = { bg = palette.background.brighter },

	TabLineFill = { bg = palette.background.brightest },
	TabLine = { fg = palette.foreground.dimmed, bg = palette.background.brightest },
	TabLineSel = { fg = palette.foreground.medium },

	Pmenu = { fg = palette.foreground.medium, bg = palette.background.brightest },
	PmenuSel = groups.selection,
	PmenuSbar = { bg = palette.background.brightest },

	Conceal = groups.darker,
	Title = groups.brighter,
	Question = groups.brighter,
	SpecialKey = groups.darkest,
	WildMenu = { fg = palette.foreground.medium, bg = palette.background.brightest },
	Folded = { fg = palette.foreground.darker, bg = palette.background.brighter },
	FoldColumn = { fg = palette.foreground.darkest, bg = palette.background.medium },

	-- Spelling
	SpellBad = groups.underline,
	SpellLocal = groups.underline,
	SpellCap = groups.underline,
	SpellRare = groups.underline,

	-- Syntax
	Boolean = groups.brighter,
	Character = groups.brighter,
	Comment = groups.darker,
	Conditional = groups.dimmed,
	Constant = groups.brighter,
	Define = groups.darker,
	Delimiter = groups.darker,
	Float = groups.brighter,
	Function = groups.brighter,
	Identifier = groups.medium,
	Include = groups.darker,
	Keyword = groups.dimmed,
	Label = groups.darker,
	Number = groups.brighter,
	Operator = groups.darker,
	PreProc = groups.darker,
	Repeat = groups.darker,
	Special = groups.brighter,
	SpecialChar = groups.brighter,
	Statement = groups.medium,
	StorageClass = groups.brighter,
	String = groups.brighter,
	Structure = groups.brighter,
	Tag = groups.medium,
	Todo = groups.brightest,
	Type = groups.brighter,
	Typedef = groups.brighter,

	-- TreeSitter
	TSAnnotation = groups.darker,
	TSAttribute = groups.darker,
	TSBoolean = groups.brighter,
	TSCharacter = groups.brighter,
	TSCharacterSpecial = groups.brighter,
	TSComment = groups.darker,
	TSConditional = groups.medium,
	TSConstant = groups.brighter,
	TSConstBuiltin = groups.brighter,
	TSConstMacro = groups.darker,
	TSConstructor = groups.brighter,
	TSDebug = groups.medium,
	TSDefine = groups.medium,
	TSError = groups.brightest,
	TSException = groups.brightest,
	TSField = groups.medium,
	TSFloat = groups.brighter,
	TSFunction = groups.brighter,
	TSFuncBuiltin = groups.brighter,
	TSFuncMacro = groups.brighter,
	TSInclude = groups.darker,
	TSKeyword = groups.dimmed,
	TSKeywordFunction = groups.dimmed,
	TSKeywordOperator = groups.dimmed,
	TSKeywordReturn = groups.dimmed,
	TSLabel = groups.darker,
	TSMethod = groups.brighter,
	TSNamespace = groups.darker,
	TSNone = groups.darkest,
	TSNumber = groups.brighter,
	TSOperator = groups.darker,
	TSParameter = groups.medium,
	TSParameterReference = groups.darker,
	TSPreProc = groups.darker,
	TSProperty = groups.medium,
	TSPunctDelimiter = groups.darker,
	TSPunctBracket = groups.darker,
	TSPunctSpecial = groups.darker,
	TSRepeat = groups.darker,
	TSStorageClass = groups.medium,
	TSString = groups.brighter,
	TSStringRegex = groups.brighter,
	TSStringEscape = groups.medium,
	TSStringSpecial = groups.medium,
	TSSymbol = groups.brighter,
	TSTag = groups.medium,
	TSTagAttribute = groups.darker,
	TSTagDelimiter = groups.darker,
	TSText = groups.medium,
	TSStrong = groups.bold,
	TSEmphasis = groups.italic,
	TSUnderline = groups.underline,
	TSStrike = { strikethrough = true },
	TSTitle = groups.brighter,
	TSLiteral = groups.brighter,
	TSURI = groups.medium_underline,
	TSMath = groups.darker,
	TSTextReference = groups.darker,
	TSEnvironment = groups.darker,
	TSEnvironmentName = groups.darker,
	TSNote = groups.medium,
	TSWarning = groups.brighter,
	TSDanger = groups.brightest,
	TSTodo = groups.brightest,
	TSType = groups.medium,
	TSTypeBuiltin = groups.medium,
	TSTypeQualifier = groups.darker,
	TSTypeDefinition = groups.medium,
	TSVariable = groups.medium,
	TSVariableBuiltin = groups.medium,

	-- Diff
	DiffAdd = { bg = palette.background.brighter },
	DiffAdded = { fg = palette.foreground.medium },

	DiffDelete = { fg = palette.background.brighter, bg = palette.background.brighter },
	DiffRemoved = { fg = palette.foreground.darker },

	DiffChange = { bg = palette.background.brighter },
	DiffText = { fg = palette.background.medium, bg = palette.foreground.darker, bold = true },

	DiffLine = { fg = palette.foreground.darker },

	-- Telescope
	TelescopeSelectionCaret = { bg = palette.background.brightest },
	TelescopeSelection = { bg = palette.background.brightest },
	TelescopeMatching = groups.brightest_bold,

	-- Netrw
	netrwMarkFile = { bg = palette.background.brightest },
}

for group, set in pairs(higlight_groups) do
	vim.api.nvim_set_hl(0, group, {
		fg = set.fg,
		bg = set.bg,
		bold = set.bold or false,
		italic = set.italic or false,
		underline = set.underline or false,
	})
end
