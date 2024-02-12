return {
    "nvim-telescope/telescope.nvim",
    config = function()
        require("telescope").setup()
        local map = require("ecavenr.keys").map
        map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", "Find all files")
    end
}
