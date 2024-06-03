return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
		require("neo-tree").setup({
			window = {
				width = 30,
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["<c-o>"] = "focus_preview",
					["S"] = "open_split",
					["s"] = "open_vsplit",
				},
				fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
					["<down>"] = "move_cursor_down",
					["<c-j>"] = "move_cursor_down",
					["<up>"] = "move_cursor_up",
					["<c-k>"] = "move_cursor_up",
				},
			},
			buffers = { follow_current_file = { enabled = true } },
			filesystem = {
				follow_current_file = { enabled = true },
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						-- example: "node_modules",
					},
					never_show = { ".DS_Store" },
				},
			},
		})
	end,
}
