-- local api = vim.api
-- local global = require 'core.global'
local lspconfig = require 'lspconfig'

local M = {}

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

M.lsp_setup = function()
  function _G.reload_lsp()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
    vim.cmd [[edit]]
  end

  function _G.open_lsp_log()
    local path = vim.lsp.get_log_path()
    vim.cmd("edit " .. path)
  end

  vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')
  vim.cmd('command! -nargs=0 LspRestart call v:lua.reload_lsp()')

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = false,
      signs = {
        enable   = true,
        priority = 20
      },
      update_in_insert = false,
    })

  local signs = { Error = "", Warn = "", Hint = "", Info = "" }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  --   border = "rounded",
  -- })

  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  --   border = "rounded",
  -- })

  -- modify open_floating_preview to use the custom borders
  -- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  -- local open_floating_preview_custom = function(contents, syntax, opts, ...)
  --   opts = opts or {}
  --   -- Ideally I would like to retrieve severity here, to use that border array or another one.
  --   opts.border = "rounded"
  --   opts.max_width = 60
  --   opts.max_height = 20
  --   return orig_util_open_floating_preview(contents, syntax, opts, ...)
  -- end
  -- vim.lsp.util.open_floating_preview = open_floating_preview_custom
end

M.setup = function()
  local default_capabilities = vim.tbl_deep_extend("force",
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
  )

  local default_on_attach = function(client, bufnr)
    vim.o["foldmethod"] = "expr"

    local default_capabilities = vim.tbl_deep_extend("force",
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities()
    )

    client.capabilities = default_capabilities
  end


  lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
    on_attach = default_on_attach,
    capabilities = default_capabilities,
  })

  M.lsp_setup()

  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "vimls",
      "gopls",
      "golangci_lint_ls",
      "templ",
      "htmx",
      "rust_analyzer",
      "cssls",
      "vuels",
      "eslint",
    },
    handlers = {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
          capabilities = default_capabilities,
          on_attach = default_on_attach,
        }
      end,

      ["gopls"] = function()
        lspconfig.gopls.setup {
          cmd = { "gopls", "--remote=auto" },
          filetypes = { 'go', 'gomod' },
          root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
          capabilities = default_capabilities,
          on_attach = default_on_attach,
          init_options = {
            analyses           = {
              unusedparams   = true,
              fieldalignment = true,
              nilness        = true,
              shadow         = true,
              unusedwrite    = true,
            },
            staticcheck        = true,
            usePlaceholders    = true,
            completeUnimported = true,
          }
        }
      end,

      ["golangci_lint_ls"] = function()
        lspconfig.gopls.setup {
          cmd = { 'golangci-lint-langserver' },
          root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
          filetypes = { 'go', 'gomod' },
          init_options = {
            command = { "golangci-lint", "run", "--disable", "lll", "--out-format", "json" },
          },
          capabilities = default_capabilities,
          on_attach = default_on_attach,
        }
      end,

      -- ["htmx"] = function()
      --   lspconfig.htmx.setup {
      --     capabilities = default_capabilities,
      --     on_attach = default_on_attach,
      --   }
      -- end,

    }
  })
end

return M
