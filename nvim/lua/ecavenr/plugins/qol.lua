return {
  -- Automatic pair closing
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}     -- this is equalent to setup({}) function
  },

  -- Remove spaces to the right, but only on modified lines
  {
    "thirtythreeforty/lessspace.vim"
  },
}
