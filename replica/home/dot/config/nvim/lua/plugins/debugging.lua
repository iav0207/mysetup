return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>dc", dap.continue, {})

        local dapui = require("dapui")
        dapui.setup({})

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- For language support refer to:
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

        -- Go
        require("dap-go").setup({})
    end,
}
