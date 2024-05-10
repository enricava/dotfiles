return {
    -- Nice theme
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = false, -- load at startup
        priority = 1000, -- before other plugins
        config = function ()
            -- load colorscheme
            -- wave, dragon, lotus
            vim.cmd([[colorscheme kanagawa-dragon]])
        end,
    },
}
