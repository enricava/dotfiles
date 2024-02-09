return {
    -- Update all
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "vimdoc", "vim" },
    auto_install = true,
    build = ":TSUpdate",
}
