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
    keys = {
      {
        "<C-e>",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            position = "right",
            reveal = true,
          })
        end,
        desc = "Toggle file explorer",
        mode = { "n", "v", },
      },
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      window = {
        position = "right"
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
}
