-- Show diagnostics in new window
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- default settings
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Toggle trouble diagnostics",
    },
    {
      "<leader>ts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Toggle trouble symbols",
    },
    {
      "<leader>tl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "Toggle trouble lsp",
    },
    {
      "<leader>ta",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Toggle trouble quickfix actions",
    },
  },
}
