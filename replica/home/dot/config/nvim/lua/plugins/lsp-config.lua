return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"kotlin_language_server",
					"ktlint",
					"stylua",
					"black",
					"isort",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"hls", --haskell
					"kotlin_language_server",
					"lua_ls",
					"pyright", -- python
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		keys = {
			{
				"gD",
				"<cmd>lua vim.lsp.buf.declaration()<cr>",
				desc = "Goto declaration",
			},
			{
				"gW",
				"<cmd>lua vim.lsp.buf.workspace_symbol()<cr>",
				desc = "Search for workspace symbol",
			},
			{
				"K",
				"<cmd>lua vim.lsp.buf.hover()<cr>",
				desc = "LSP hover",
			},
			{
				"gk",
				"<cmd>lua vim.lsp.buf.hover()<cr>",
				desc = "LSP hover",
			},
			{
				"<leader>rn",
				"<cmd>lua vim.lsp.buf.rename()<cr>",
				desc = "Rename word under cursor",
			},
			{
				"<leader>ca",
				"<cmd>lua vim.lsp.buf.code_action()<cr>",
				desc = "Code Actions",
			},
			{
				"gd",
				"<cmd>lua vim.lsp.buf.definition()<cr>",
				desc = "Goto definition",
			},
			{
				"gi",
				"<cmd>lua vim.lsp.buf.implementation()<cr>",
				desc = "Goto implementation",
			},
			{
				"gr",
				"<cmd>lua vim.lsp.buf.references()<cr>",
				desc = "Show references",
			},
			{
				"[d",
				"<cmd>lua vim.diagnostic.goto_prev()<cr>",
				desc = "Goto previous diagnostic",
			},
			{
				"]d",
				"<cmd>lua vim.diagnostic.goto_next()<cr>",
				desc = "Goto next diagnostic",
			},
			{
				"<leader>e",
				"<cmd>lua vim.diagnostic.open_float()<cr>",
				desc = "Open diagnostic float",
			},
			{
				"<leader>i",
				"<cmd>lua vim.diagnostic.open_float()<cr>",
				desc = "Open diagnostic float",
			},
		},
		config = function()
			local cap = require("cmp_nvim_lsp").default_capabilities()

			local lspc = require("lspconfig")
			lspc.hls.setup({ capabilities = cap })
			lspc.kotlin_language_server.setup({ capabilities = cap })
			lspc.lua_ls.setup({ capabilities = cap })
			lspc.pyright.setup({ capabilities = cap })

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
