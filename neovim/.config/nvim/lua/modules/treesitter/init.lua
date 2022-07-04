local config = {}

config.setup = function()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "maintained",
    ensure_installed = { "c", "lua", "rust", "go", "javascript", "typescript", "html", "yaml", "tsx", "graphql", "json5" },
    ident = {
      enable = false,
    },
    highlight = {
      enable = true,
      disable = function(lang, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 50000
      end
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- ["af"] = "@function.outer",
          -- ["if"] = "@function.inner",
          -- ["ac"] = "@class.outer",
          -- ["ic"] = "@class.inner",
          -- ["ai"] = "@conditional.outer",
          -- ["ii"] = "@conditional.inner",
          -- ["al"] = "@loop.outer",
          -- ["il"] = "@loop.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]]"] = "@function.outer",
        },
        goto_next_end = {
          ["]["] = "@function.outer",
        },
        goto_previous_start = {
          ["[["] = "@function.outer",
        },
        goto_previous_end = {
          ["[]"] = "@function.outer",
        },
      },
      -- lsp_interop = {
      --   enable = true,
      --   border = 'none',
      --   peek_definition_code = {
      --     ["df"] = "@function.outer",
      --     ["dF"] = "@class.outer",
      --   },
      -- },
    },
  }

  require'nvim-treesitter.utils'
  require'nvim-treesitter.query'
end

return config
