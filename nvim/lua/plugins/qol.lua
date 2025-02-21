return {
  -- Remove spaces to the right of modified lines
  { "thirtythreeforty/lessspace.vim" },

  -- Use tab for completion
  {
    "saghen/blink.cmp",
    opts = {
      keymap = { preset = "super-tab" },
    },
  },

  -- Guess indentation
  {
    "nmac427/guess-indent.nvim",
    enable = false,
    event = "BufEnter",
    config = function()
      require("guess-indent").setup({})
    end,
  },

  -- Disable format on save
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      autoformat = false,
    },
  },

  {
    "snacks.nvim",
    opts = {
      -- Disable scroll animation
      scroll = { enabled = false },
      dashboard = {
        preset = {
          -- Custom header
          header = [[
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░   ░░░░░░░░░░░░░░░░░░░░░░  ░░░░░░░░░░
▒▒▒   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒
▒       ▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒   ▒▒▒
▓▓▓   ▓▓▓▓   ▓▓   ▓▓  ▓▓      ▓▓  ▓▓▓  ▓
▓▓▓   ▓▓▓   ▓▓▓▓   ▓  ▓  ▓▓▓  ▓        ▓
▓▓▓   ▓ ▓▓   ▓▓   ▓▓  ▓  ▓▓▓  ▓  ▓▓▓▓▓▓▓
████   █████    ████  ██      ███     ██
████████████████████████████████████████
    ]],
        },
      },
    },
  },
}
