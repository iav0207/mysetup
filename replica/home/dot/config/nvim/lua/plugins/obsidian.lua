return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "brain3",
				path = "~/brain3",
			},
		},
	},
	completion = { -- Completion of wiki links, local markdown links, and tags using nvim-cmp.
		nvim_cmp = true,
		min_chars = 2,
	},
	mappings = {
		["<leader>och"] = { -- Toggle check-boxes.
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},
    config = function()
        vim.opt_local.conceallevel = 2
    end,
}
