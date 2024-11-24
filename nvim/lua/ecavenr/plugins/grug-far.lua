return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({});

    local map = require("ecavenr.keys").map
    map("n", "<leader>fm", "<CMD>GrugFar<CR>", "Find and replace")
  end
}
