return {
	"cranberry-clockworks/coal.nvim",
	lazy = false,
	init = function()
		require("coal").setup()
		require("utils.transparent-bg")
	end,
}
