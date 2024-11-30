return {
  -- Automatic pair closing
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {} -- this is equalent to setup({}) function
  },

  -- Remove spaces to the right, but only on modified lines
  {
    'thirtythreeforty/lessspace.vim'
  },

  -- Surround text easily
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
  },

  -- Better marks
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  -- Vertical lines on indents
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufEnter',
    opts = {
      indent = {
        char = '│',
      },
      exclude = {
        filetypes = {
          'terminal',
          'nofile',
          'quickfix',
          'prompt',
          'neo-tree',
          'dashboard',
          'lspinfo',
          'help',
          'man',
          'gitcommit',
          'TelescopePrompt',
          'TelescopeResults',
          '',
        },
      },
    },
  },


}
