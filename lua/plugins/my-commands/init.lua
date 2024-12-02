return {
	"my-commands",
	name = "my-commands",
	dev = true,
	event = "VeryLazy",
	config = function()
		require("plugins.my-commands.JavaCreate")
	end,
}
