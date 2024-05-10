return {
    {
        -- Update all
        "nvim-treesitter/nvim-treesitter",
        ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "vimdoc", "vim" },
        auto_install = true,
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/playground"
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        -- Commenting, like gcc and gc
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
        config = function ()
            require('Comment').setup()
        end
    },
    {
        "thirtythreeforty/lessspace.vim"
    },
}
