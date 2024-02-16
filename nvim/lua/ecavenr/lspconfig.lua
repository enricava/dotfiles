local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local map = require("ecavenr.keys").map

    -- see :help lsp-zero-keybindings
    -- to learn the available actions

    map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Code Rename")
    map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions")
    map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", "Code Format")
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", "View References")
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "View definition")

    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.set_sign_icons({
  error = '',
  warn = '',
  hint = ' ',
  info = '»'
})

-- Setup language servers
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

local lspconfig = require('lspconfig')

local lua_opts = lsp_zero.nvim_lua_ls()

lspconfig.lua_ls.setup(lua_opts)
lspconfig.clangd.setup({})

-- Keybindings
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    -- Next two options for autoselection of first item
    preselect = true,
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<Tab>'] = cmp_action.luasnip_jump_forward(),
        ['<S-Tab>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})
