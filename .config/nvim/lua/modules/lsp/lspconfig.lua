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

local enhance_attach = function(client,bufnr)
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

config.setup = function()
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
      -- Enable underline, use default values
      underline = true,
      -- Enable virtual text, override spacing to 4
      virtual_text = true,
      signs = {
        enable   = true,
        priority = 20
      },
      -- Disable a feature
      update_in_insert = false,
  })

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

 lspconfig.pylsp.setup{}

  --lspconfig.sumneko_lua.setup {
    --cmd = {
      --global.home.."/.local/share/nvim/lspinstall/lua/sumneko-lua-language-server",
      --"-E",
      --global.home.."/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server/main.lua"
    --};
    --settings = {
      --Lua = {
        --diagnostics = {
          --enable = true,
          --globals = {"vim","packer_plugins"}
        --},
        --runtime = {version = "LuaJIT"},
        --workspace = {
          --library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true},{}),
        --},
      --},
    --}
  --}


end

return config
