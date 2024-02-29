return {
	"themercorp/themer.lua",
    lazy = false,
    priority = 9999,
	config = function()
		require("themer").setup({
			colorscheme = "astron",
            -- To cycle through the list of available color schemes:
            -- :lua require("telescope").load_extension("themes")
            -- :Telescope themes
		})
	end,
}
