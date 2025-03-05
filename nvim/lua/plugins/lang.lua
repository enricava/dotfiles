return {
  -- Lsp config
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  -- Flutter
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>flr", "<CMD>FlutterRun<CR>", desc = "Flutter run", mode = "n" },
      { "<leader>flR", "<CMD>FlutterRestart<CR>", desc = "Flutter restart", mode = "n" },
      { "<leader>flh", "<CMD>FlutterReload<CR>", desc = "Flutter hot reload", mode = "n" },
      { "<leader>fle", "<CMD>FlutterEmulators<CR>", desc = "Flutter emulators", mode = "n" },
      { "<leader>fld", "<CMD>FlutterDevices<CR>", desc = "Flutter devices", mode = "n" },
      { "<leader>flq", "<CMD>FlutterQuit<CR>", desc = "Flutter quit", mode = "n" },
      { "<leader>flc", "<CMD>FlutterLogClear<CR>", desc = "Flutter log clear", mode = "n" },
      { "<leader>fll", "<CMD>FlutterLspRestart<CR>", desc = "Flutter lsp restart", mode = "n" },
    },
    config = true,
  },
}
