return {
    "nvim-telescope/telescope.nvim",
    config = function()
        require("telescope").setup()
        local map = require("ecavenr.keys").map
        map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", "Find all files")
        map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", "Live grep")
        map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", "Buffers")
        map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", "Help tags")
    end
}
