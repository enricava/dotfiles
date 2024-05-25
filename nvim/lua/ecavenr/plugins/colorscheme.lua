return {
    -- Favorite theme
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = false,    -- load at startup
        priority = 1000, -- before other plugins
        config = function()
            require('kanagawa').setup({
                compile = false,  -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = true,    -- do not set background color
                dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = {             -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = { ui = { bg_gutter = "none" } } },
                },
                theme = "wave",    -- Load "wave" theme when 'background' option is not set
                background = {     -- map the value of 'background' option to a theme
                    dark = "wave", -- try "dragon" !
                    light = "lotus"
                },
                overrides = function(colors)
                  local theme = colors.theme
                  return {
                      NormalFloat = { bg = "none" },
                      FloatBorder = { bg = "none" },
                      FloatTitle = { bg = "none" },

                      -- Save an hlgroup with dark background and dimmed foreground
                      -- so that you can use it where your still want darker windows.
                      -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                      NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                      -- Popular plugins that open floats will link to NormalFloat by default;
                      -- set their background accordingly if you wish to keep them dark and borderless
                      LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                      MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                      Pmenu = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                      -- PmenuSel = { bg = theme.ui.bg_m1, fg = theme.ui.fg },
                      -- PmenuSbar = { bg = theme.ui.bg_m1 },
                      -- PmenuThumb = { bg = theme.ui.bg_p2 },

                  }
              end,
            })

            -- setup must be called before loading
            vim.cmd([[colorscheme kanagawa-wave]])

            -- fix ugly telescope borders
            vim.cmd 'highlight TelescopeBorder guibg=none'
            vim.cmd 'highlight TelescopeTitle guibg=none'
        end,
    },
}
