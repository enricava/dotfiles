return {
  -- Automatic pair closing
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}     -- this is equalent to setup({}) function
  },

  -- Remove spaces to the right, but only on modified lines
  {
    "thirtythreeforty/lessspace.vim"
  },

  -- Surround text easily
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  -- Better marks
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  }

}
