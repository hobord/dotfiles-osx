local config = {}

config.setup = function()
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local luasnip = require("luasnip")
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

        -- For `luasnip` user.
        require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },

    formatting = {
      format = require"lspkind".cmp_format {
        with_text = true,
        menu = {
          buffer      = "[BUF]",
          nvim_lsp    = "[LSP]",
          nvim_lua    = "[API]",
          path        = "[PATH]",
          luasnip     = "[SNIP]",
          cmp_tabnine = "[TN]",
        },
      },
    },

    mapping = {
      ['<C-d>']     = cmp.mapping.scroll_docs(-4),
      ['<C-f>']     = cmp.mapping.scroll_docs(4),
      ['<C-X>'] = cmp.mapping.complete(),
      ['<C-e>']     = cmp.mapping.close(),
      ['<CR>']      = cmp.mapping.confirm({ select = true }),
      ["<Tab>"]     = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        --elseif has_words_before() then
          --cmp.complete()
        else
          fallback()
          --vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },

    sources = {
      { name = 'luasnip' },
      { name = 'cmp_tabnine' },
      { name = 'nvim_lsp' },
      --{ name = 'vsnip' },
      -- { name = 'ultisnips' },
      { name = 'buffer', keyword_length = 3 },
      { name = 'path' },
    },

    experimental = {
      native_menu = false,
      ghost_text = true,
    },

    documentation = {
      --border = { '', '', '', ' ', '', '', '', ' ' },
      border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
    },
  })

end

return config
