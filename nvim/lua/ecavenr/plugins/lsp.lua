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
    keys = {
      { "<leader>cr", vim.lsp.buf.rename,             desc = "Code Rename",     mode = "n" },
      { "<leader>ca", vim.lsp.buf.code_action,        desc = "Code Actions",    mode = "n" },
      { "<leader>cf", vim.lsp.buf.format,             desc = "Code Format",     mode = "n" },
      { "<leader>cf", vim.lsp.buf.format,             desc = "Code Format",     mode = "v" },
      { "gr",         vim.lsp.buf.references,         desc = "View References", mode = "n" },
      { "gd",         vim.lsp.buf.definition,         desc = "View definition", mode = "n" },
      { "gi",         vim.lsp.buf.incoming_calls,     desc = "Incoming calls",  mode = "n" },
      { "gi",         vim.lsp.buf.outgoing_calls,     desc = "Outgoing calls",  mode = "n" },
      { "gs",         vim.lsp.buf.signature_help,     desc = "Signature help",  mode = "n" },
      { "gH",         vim.lsp.buf.document_highlight, desc = "Highlight",       mode = "n" },
      { "gC",         vim.lsp.buf.clear_references,   desc = "Clear hls",       mode = "n" },
      {
        "gv",
        "<cmd>:vsplit | wincmd w | lua vim.lsp.buf.definition()<cr>",
        desc = "Split window and view definition",
        mode = "n",
      },
    },
    config = function()
      require("ecavenr.lspconfig")
    end
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
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
