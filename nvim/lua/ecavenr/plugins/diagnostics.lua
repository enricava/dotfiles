-- Show diagnostics in new window
return {
  "folke/trouble.nvim",
  envent = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- default settings
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>td",
      vim.diagnostic.open_float,
      desc = "Toggle floating diagnostic",
    },
    {
      "<leader>tf",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Toggle diagnostics quickfix list",
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
