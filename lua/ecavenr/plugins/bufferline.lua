-- See current buffers at the top of the editor
return {
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
        config = function()
            require("bufferline").setup()
            local map = require("helpers.keys").map
            map("n", "<S-x>", "<CMD>bd<CR>", "Close current buffer")
            map("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", "Next buffer/tab")
            map("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", "Previous buffer/tab")
        end
    },
}
