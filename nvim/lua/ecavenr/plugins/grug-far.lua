local map = require("ecavenr.keys").map
map("n", "<leader>fm", "<CMD>GrugFar<CR>", "Find and replace")

return {
  'MagicDuck/grug-far.nvim',
  event = "VeryLazy",
  opts = {}
}
