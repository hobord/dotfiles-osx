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
          buffer      = "  ",
          nvim_lsp    = "  ",
          nvim_lua    = "  ",
          path        = "  ",
          luasnip     = "  ",
          cmp_tabnine = "  ",
          copilot     = " ﯙ ",
        },
      },
    },

    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.

      ['<c-h>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({
            -- behavior = cmp.ConfirmBehavior.Insert,
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
        else
          fallback()
        end
      end, {"i", "s"}),

      ["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<C-k>"] = cmp.mapping(function(fallback)
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
      -- { name = 'copilot', keyword_length = 2 },
      { name = 'luasnip', keyword_length = 2 },
      { name = 'cmp_tabnine', keyword_length = 3 },
      { name = 'nvim_lsp', keyword_length = 1 },
      { name = 'buffer', keyword_length = 3 },
      { name = 'path', keyword_length = 3 },
    },

    experimental = {
      native_menu = false,
      ghost_text = true,
    },

    -- window.documentation= "native"
    -- documentation = {
    --   border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
    -- },
  })

end

return config