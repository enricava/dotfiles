local map = require("ecavenr.keys").map
local dap = require("dap")

-- Keymaps
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint in line")
map("n", "<leader>dr", "<cmd>DapContinue<cr>", "Start/continue debugging")
map("n", "<leader>dc", "<cmd>DapContinue<cr>", "Start/continue debugging")
map("n", "<leader>di", "<cmd>DapStepInto<cr>", "Step into")
map("n", "<leader>do", "<cmd>DapStepOver<cr>", "Step over")

-- Debug adapters
dap.adapters.dart = {
  type = "executable",
  command = "flutter",
  args = { "debug_adapter", "--test" },
}

-- Debug configurations
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Debug open test file",
    cwd = "${workspaceFolder}",
    program = "${relativeFile}",
  },
}
