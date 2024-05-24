local map = require("ecavenr.keys").map

return {
    -- Debug Adapter
    {
        "mfussenegger/nvim-dap",
        config = function()
            -- Keymaps
            map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint in line")
            map("n", "<leader>dr", "<cmd>DapContinue<cr>", "Start/continue debugging")
            map("n", "<leader>dc", "<cmd>DapContinue<cr>", "Start/continue debugging")
            map("n", "<leader>di", "<cmd>DapStepInto<cr>", "Step into")
            map("n", "<leader>do", "<cmd>DapStepOver<cr>", "Step over")
        end
    },

    -- Close gap between mason and mason-nvim-dap
    -- cpptools works well
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },

    -- Ui for nvim-dap
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            map("n", "<leader>dk", "<cmd>lua require('dapui').eval()<cr>", "Eval value")
        end
    }
}
