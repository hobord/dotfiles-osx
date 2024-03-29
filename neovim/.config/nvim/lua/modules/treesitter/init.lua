local config = {}

config.setup = function()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  vim.g.ts_highlight_lua = true
  require 'nvim-treesitter.configs'.setup {
    -- ensure_installed = "maintained",
    auto_install = true,
    ensure_installed = { "c", "lua", "rust", "go", "javascript", "typescript", "html", "yaml", "tsx", "graphql",
      "json5", "sql", "css", "toml", "python", "dockerfile", "cmake", "dot", "terraform" },
    ident = {
      enable = false,
      disable = function(lang, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 50000
      end
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(lang, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 50000
      end
    },
    incremental_selection = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      keymaps = {
        init_selection = "<cr>",
        node_incremental = "<c-j>",
        node_decremental = "<c-k>",
        scope_incremental = "<cr>",
      },
      disable = function(lang, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 50000
      end
    },
    textobjects = {
      select = {
        enable = true,
        disable = function(lang, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 50000
        end,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          ["ib"] = "@block.inner",
          ["ab"] = "@block.outer",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
      },
      move = {
        enable = true,
        disable = function(lang, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 50000
        end,
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


  local treesitter_parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  treesitter_parser_config.templ = {
    install_info = {
      url = "https://github.com/vrischmann/tree-sitter-templ.git",
      files = { "src/parser.c", "src/scanner.c" },
      branch = "master",
    },
  }

  vim.treesitter.language.register('templ', 'templ')
  require 'nvim-treesitter.utils'
  require 'nvim-treesitter.query'
  vim.bo.syntax = 'on'
end

return config
