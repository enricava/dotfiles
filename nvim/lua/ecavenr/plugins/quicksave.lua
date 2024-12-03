return {
  "enricava/quicksave.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>sl", "<CMD>SessionLoad<CR>", desc = "Load previous session", mode = "n" },
    { "<leader>ss", "<CMD>SessionSave<CR>", desc = "Save cur session",      mode = "n" },
  },
  config = function()
    require('quicksave').setup()
  end
}
