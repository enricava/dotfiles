return {
    -- Nice diagnostics
    "folke/trouble.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- default settings
    },
    config = function()
        local map = require("ecavenr.keys").map
        map("n", "<leader>tt", "<cmd>TroubleToggle<cr>", "Toggle trouble report")
    end
}
