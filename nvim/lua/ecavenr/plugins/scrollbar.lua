return {
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  },
}

