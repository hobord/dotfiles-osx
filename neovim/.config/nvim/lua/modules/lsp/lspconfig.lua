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



config.setup = function()
  local global = require 'core.global'
  local lspconfig = require 'lspconfig'


  local enhance_attach = function(client, bufnr)
    vim.o["foldmethod"]="expr"
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)

    -- if client then
    --   client.request("textDocument/formatting", {} , nil, vim.api.nvim_get_current_buf())
    -- end
    --
    -- api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  end

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

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  -- modify open_floating_preview to use the custom borders
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  local open_floating_preview_custom = function(contents, syntax, opts, ...)
    opts = opts or {}
    -- Ideally I would like to retrieve severity here, to use that border array or another one.
    opts.border = "rounded"
    opts.max_width = 60
    opts.max_height = 20
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end
  vim.lsp.util.open_floating_preview = open_floating_preview_custom

  lspconfig.gopls.setup {
    cmd = {"gopls", "--remote=auto"},
    filetypes = {'go', 'gomod'},
    root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
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

  lspconfig.rust_analyzer.setup({
    capabilities=capabilities,
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy diagnostics on save
        checkOnSave = {
          command = "clippy"
        },
      }
    }
  })
  -- lspconfig.pylsp.setup{}
  lspconfig.pyright.setup{}
  lspconfig.dockerls.setup{}
  lspconfig.graphql.setup{}
  lspconfig.intelephense.setup{}
  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({
            eslint_bin = "eslint_d",
            eslint_enable_diagnostics = true,
            eslint_enable_code_actions = true,
            enable_formatting = true,
            formatter = "prettier",
        })
        ts_utils.setup_client(client)
        -- buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        -- buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        -- buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        -- on_attach(client, bufnr)
    end,
  })
  lspconfig.sumneko_lua.setup {
    cmd = {
      -- global.home.."/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"
      global.data_dir.."../lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"
    };
    on_attach = enhance_attach;
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
