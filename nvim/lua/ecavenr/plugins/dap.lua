return {
  -- Debug Adapter
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Add breakpoint in line",   mode = "n" },
      { "<leader>dr", "<cmd>DapContinue<cr>",         desc = "Start/continue debugging", mode = "n" },
      { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Start/continue debugging", mode = "n" },
      { "<leader>di", "<cmd>DapStepInto<cr>",         desc = "Step into",                mode = "n" },
      { "<leader>do", "<cmd>DapStepOver<cr>",         desc = "Step over",                mode = "n" },
    },
    config = function()
      require('ecavenr.dapconfig')
    end,
    dependencies = {
      -- Close gap between mason and mason-nvim-dap
      -- cpptools works well
      {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
          "williamboman/mason.nvim",
        },
        opts = {
          handlers = {},
        },
      },

    }
  },

  -- Ui for nvim-dap
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    keys = {
      { "<leader>dk", "<cmd>lua require('dapui').eval()<cr>", desc = "Eval value", mode = "n" },
    },
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
    end
  }
}
