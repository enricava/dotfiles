-- Top dropbar, requires nvim 0.10
return {
    {
        "Bekaboo/dropbar.nvim",
        -- optional, but required for fuzzy finder support
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim"
        }
    },
}
