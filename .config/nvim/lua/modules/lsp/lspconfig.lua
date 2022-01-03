local api = vim.api
local global = require 'core.global'
local config = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation';
        'detail';
        'additionalTextEdits';
        'tags';
        'deprecated';
    }
}

local enhance_attach = function(client, bufnr)
  client.request("textDocument/formatting", {} , nil, vim.api.nvim_get_current_buf())
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

config.setup = function()
  local global = require 'core.global'
  local lspconfig = require 'lspconfig'

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

  local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  lspconfig.gopls.setup {
    cmd = {"gopls","--remote=auto"},
    on_attach = enhance_attach,
    capabilities = capabilities,
    init_options = {
      analyses = {
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

  -- lspconfig.pylsp.setup{}
  lspconfig.pyright.setup{}
  lspconfig.dockerls.setup{}
  lspconfig.graphql.setup{}
  lspconfig.intelephense.setup{}
  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        -- local ts_utils = require("nvim-lsp-ts-utils")
        -- ts_utils.setup({
        --     eslint_bin = "eslint_d",
        --     eslint_enable_diagnostics = true,
        --     eslint_enable_code_actions = true,
        --     enable_formatting = true,
        --     formatter = "prettier",
        -- })
        -- ts_utils.setup_client(client)
        -- buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        -- buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        -- buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
  })
  lspconfig.sumneko_lua.setup {
    cmd = {
     global.home.."/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/macOS/lua-language-server"
    };
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = {"vim","packer_plugins"}
        },
        runtime = {version = "LuaJIT"},
        workspace = {
          library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true},{}),
        },
      },
    }
  }


end

return config
