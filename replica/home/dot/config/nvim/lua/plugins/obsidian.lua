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
                name = "isaevav27",
                path = "~/proj/obsidian/isaevav27",
            },
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
    },
}
