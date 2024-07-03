local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local map = require("ecavenr.keys").map

    map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Code Rename")
    map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions")
    map("n", "<leader>cf", vim.lsp.buf.format, "Code Format")
    map("v", "<leader>cf", vim.lsp.buf.format, "Code Format")
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", "View References")
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "View definition")
    map("n", "gv", "<cmd>:vsplit | wincmd w | lua vim.lsp.buf.definition()<cr>", "Split window and view definition")

    lsp_zero.default_keymaps({ buffer = bufnr })
end)


-- Diagnostic icons
lsp_zero.set_sign_icons({
    error = '',
    warn = '',
    hint = ' ',
    info = '»'
})


-- Mason general
require('mason').setup({})

-- Setup language servers
require('mason-lspconfig').setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "dockerls",
        "gopls",
        "helm_ls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "neocmake",
        "pylsp",
        "rust_analyzer",
        "tsserver",
        -- "hls",
        -- "java_language_server",
        -- "markdown_oxide",
        -- "ruff",
        -- "sqls",
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end
    },
})


-- Configure autocompletion
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = "nvim_lsp_signature_help" },
        { name = 'luasnip' },
    },
    -- Next two options for autoselection of first item
    preselect = true,
    -- window = {
    --     -- completion = cmp.config.window.bordered(),
    --     -- documentation = cmp.config.window.bordered(),
    -- },
    formatting = {
        format = require('lspkind').cmp_format(),
    },
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },
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
    }),
})
