return {
    {
        "EdenEast/nightfox.nvim",
        name = "nightfox",
        lazy = false,
        priority = 1000, -- before other plugins
        config = function()
            -- Default options
            require('nightfox').setup({
                options = {
                    transparent = false, -- Disable setting background
                    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = false, -- Non focused panes set to alternative background
                    module_default = true, -- Default enable value for modules
                    styles = { -- Style to be applied to different syntax groups
                        comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
                        conditionals = "NONE",
                        constants = "NONE",
                        functions = "NONE",
                        keywords = "bold",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "NONE",
                        variables = "NONE",
                    },
                    inverse = { -- Inverse highlight for different types
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                    modules = { -- List of various plugins and additional options
                        -- ...
                    },
                },
                palettes = {},
                specs = {},
                groups = {},
            })

            -- setup must be called before loading
            vim.cmd("colorscheme carbonfox")

            -- fix ugly telescope borders
            vim.cmd 'highlight TelescopeBorder guibg=none'
            vim.cmd 'highlight TelescopeTitle guibg=none'
        end,
    },
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
                transparent = false,   -- do not set background color
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
            -- vim.cmd([[colorscheme kanagawa-wave]])

            -- fix ugly telescope borders
            vim.cmd 'highlight TelescopeBorder guibg=none'
            vim.cmd 'highlight TelescopeTitle guibg=none'
        end,
    },
}
