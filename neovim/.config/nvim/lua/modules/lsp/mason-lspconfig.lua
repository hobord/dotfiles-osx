-- local api = vim.api
-- local global = require 'core.global'
local M = {}

M.setup = function()
  local lspconfig = require 'lspconfig'

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
      require('fidget').setup()

      -- The following two autocommands are used to highlight references of the
      -- word under your cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      --
      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = event.buf,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = event.buf,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end,
  })

  -- LSP servers and clients are able to communicate to each other what features they support.
  --  By default, Neovim doesn't support everything that is in the LSP Specification.
  --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
  --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. Available keys are:
  --  - cmd (table): Override the default command used to start the server
  --  - filetypes (table): Override the default list of associated filetypes for the server
  --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
  --  - settings (table): Override the default settings passed when initializing the server.
  --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
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

  local servers = {
    -- clangd = {},
    gopls = {
      cmd = { "gopls", "--remote=auto" },
      filetypes = { 'go', 'gomod' },
      root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    },
    golangci_lint_ls = {
      cmd = { "golangci-lint-langserver" },
      filetypes = { 'go', 'gomod' },
      root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
      init_options = {
        command = { "golangci-lint", "run", "--disable", "lll", "--out-format", "json" },
      },
    },
    htmx = {},
    vimls = {},
    templ = {},
    cssls = {},
    eslint = {},

    -- pyright = {},
    -- rust_analyzer = {},
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`tsserver`) will work just fine
    -- tsserver = {},
    --

    lua_ls = {
      -- cmd = {...},
      -- filetypes { ...},
      -- capabilities = {},
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            -- Tells lua_ls where to find all the Lua files that you have loaded
            -- for your neovim configuration.
            library = {
              '${3rd}/luv/library',
              unpack(vim.api.nvim_get_runtime_file('', true)),
            },
            -- If lua_ls is really slow on your computer, you can try this instead:
            -- library = { vim.env.VIMRUNTIME },
          },
          -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          diagnostics = { disable = { 'missing-fields' } },
        },
      },
    },
  }

  -- Ensure the servers and tools above are installed
  --  To check the current status of installed tools and/or manually install
  --  other tools, you can run
  --    :Mason
  --
  --  You can press `g?` for help in this menu
  require('mason').setup()

  -- You can add other tools here that you want Mason to install
  -- for you, so that they are available from within Neovim.
  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    'stylua', -- Used to format lua code
  })
  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

  require('mason-lspconfig').setup {
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        require('lspconfig')[server_name].setup {
          cmd = server.cmd,
          settings = server.settings,
          filetypes = server.filetypes,
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
        }
      end,
    },
  }
end

return M
