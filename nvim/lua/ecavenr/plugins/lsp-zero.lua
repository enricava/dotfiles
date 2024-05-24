return {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },
    {
        'neovim/nvim-lspconfig',
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
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    }
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
