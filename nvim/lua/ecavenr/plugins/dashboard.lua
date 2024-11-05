return {
  "nvimdev/dashboard-nvim",
  lazy = false,   -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░   ░░░░░░░░░░░░░░░░░░░░░░  ░░░░░░░░░░
▒▒▒   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒
▒       ▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒   ▒▒▒
▓▓▓   ▓▓▓▓   ▓▓   ▓▓  ▓▓      ▓▓  ▓▓▓  ▓
▓▓▓   ▓▓▓   ▓▓▓▓   ▓  ▓  ▓▓▓  ▓        ▓
▓▓▓   ▓ ▓▓   ▓▓   ▓▓  ▓  ▓▓▓  ▓  ▓▓▓▓▓▓▓
████   █████    ████  ██      ███     ██
████████████████████████████████████████
    ]]

    logo = string.rep("\n", 2) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'Telescope find_files', desc = " Find File", icon = " ", key = "f" },
          { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "o" },
          { action = "Telescope live_grep_args live_grep_args", desc = " Find Text", icon = " ", key = "g" },
          { action = 'SessionLoad', desc = " Restore Session", icon = " ", key = "s" },
          { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
          { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = "Mason", desc = " Mason", icon = " ", key = "m" },
          { action = "qa", desc = " Quit", icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- Set background color for the text
    vim.cmd [[hi DashboardHeader guifg=#d7af87]]

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
