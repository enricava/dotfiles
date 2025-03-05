-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local function set_ssh_clipboard()
  if vim.env.SSH_CONNECTION ~= nil and vim.env.SSH_CONNECTION ~= "" then
    vim.g.clipboard = {
      name = "OSC 52",
      copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      },
      paste = {
        ["+"] = function() end,
        ["*"] = function() end,
      },
    }
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = set_ssh_clipboard,
})
