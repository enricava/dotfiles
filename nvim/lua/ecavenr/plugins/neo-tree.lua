return {
  -- "P" to preview files
  "nvim-lua/plenary.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        window = {
          position = "float"
        },
        filesystem = {
          filtered_items = {
            visible = true,
          },
        },
      })
      local map = require("ecavenr.keys").map
      map(
        { "n", "v" },
        "<C-e>",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            position = "float",
          })
        end,
        "Show file explorer"
      )
    end,
  },
  --   {"akinsho/toggleterm.nvim", version = "*", config = true}
}
