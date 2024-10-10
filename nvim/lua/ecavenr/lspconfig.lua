local lsp_zero = require('lsp-zero')

local lsp_attach = function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.extend_lspconfig({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  lsp_attach = lsp_attach,
  float_border = 'rounded',
  sign_text = true,
})

-- Diagnostic icons
lsp_zero.set_sign_icons({
  error = '',
  warn = '',
  hint = ' ',
  info = '»',
})

-- Mason
require('mason').setup({})

-- Setup language servers
require('mason-lspconfig').setup({
  ensure_installed = {
    "bashls",
    -- "clangd",
    "dockerls",
    -- "gopls",
    "helm_ls",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    -- "neocmake",
    "pylsp",
    -- "rust_analyzer",
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end
  },
})

-- Additional local lsp
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({})
lspconfig.gopls.setup({})
lspconfig.rust_analyzer.setup({})


-- Configure autocompletion
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

local luasnip = require('luasnip')
luasnip.config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave'
})

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = "nvim_lsp_signature_help" },
    { name = 'luasnip' },
  },
  -- Next two options for autoselection of first item
  preselect = true,
  -- Options for completion window
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
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
    ['<Tab>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<PageDown>'] = cmp_action.luasnip_jump_forward(),
    ['<PageUp>'] = cmp_action.luasnip_jump_backward(),
  }),
})
