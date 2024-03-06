return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	config = function()
		require("toggleterm").setup({
			start_in_insert = true,
			direction = "vertical",
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
		})
		vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", {})
		vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", {})
		vim.keymap.set("n", "<leader>tg", ":TermExec direction=float cmd=lazygit<CR>", {})
	end,
}
