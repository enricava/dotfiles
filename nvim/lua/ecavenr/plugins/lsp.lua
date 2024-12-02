return {
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
      require("ecavenr.lspconfig")
    end
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        'onsails/lspkind.nvim',
        'hrsh7th/cmp-nvim-lsp-signature-help',
      },
    },
  },
  -- Rust Crates
  {
    'saecki/crates.nvim',
    event = 'VeryLazy',
    tag = 'stable',
    config = function()
      require('crates').setup()
    end,
  },
  -- Lua development
  {
    "folke/lazydev.nvim",
    event = 'VeryLazy',
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  -- Rust tools / LSP
  -- {
  --     'mrcjkb/rustaceanvim',
  --     version = '^4', -- Recommended
  --     lazy = false, -- This plugin is already lazy
  -- }
  -- {
  --     'ray-x/lsp_signature.nvim',
  --     event = "VeryLazy",
  --     opts = {},
  --     config = function(_, opts) require 'lsp_signature'.setup(opts) end
  -- },
}
