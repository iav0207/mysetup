return {
	"themercorp/themer.lua",
	config = function()
		require("themer").setup({
            colorscheme = "catppuccin",
			-- colorscheme = "gruvbox",
            -- To cycle through the list of available color schemes:
            -- :lua require("telescope").load_extension("themes")
            -- :Telescope themes
		})
	end,
}
