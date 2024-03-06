return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/cmp-buffer",
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            vim.opt.completeopt = { "menu", "menuone", "noselect" }

            local select_opts = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    -- Docs
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    -- Move between completion items
                    ["<C-k>"] = cmp.mapping.select_prev_item(select_opts),
                    ["<C-j>"] = cmp.mapping.select_next_item(select_opts),
                    -- Termination
                    ["<C-e>"] = cmp.mapping.abort(),     -- Cancel completion
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })

            local function toggle_autocomplete()
                local current_setting = cmp.get_config().completion.autocomplete
                if current_setting and #current_setting > 0 then
                    cmp.setup({ completion = { autocomplete = false } })
                    vim.notify("Autocomplete disabled")
                else
                    cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
                    vim.notify("Autocomplete enabled")
                end
            end

            vim.api.nvim_create_user_command("NvimCmpToggle", toggle_autocomplete, {})

            -- Set a keymap like this for example:
            vim.api.nvim_set_keymap("n", "<Leader>ac", ":NvimCmpToggle<CR>", { noremap = true, silent = true })
        end,
    },
}
