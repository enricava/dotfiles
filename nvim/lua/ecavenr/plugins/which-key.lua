-- Map help
return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.add(
      {
        { "<leader>c", group = "LSP Stuff" },
        { "<leader>d", group = "Debug" },
        { "<leader>e", group = "Neotree" },
        { "<leader>f", group = "Telescope" },
        { "<leader>g", group = "Git" },
        { "<leader>t", group = "Trouble" },
      }
    )
  end
}
