local config = {}
local hi = {
  PmenuSel = { guibg = "#282C34", guifg = "NONE" },
  Pmenu = { guifg = "#C5CDD9", guibg = "#22252A" },

  CmpItemAbbrDeprecated = { guifg = "#7E8294", guibg = "NONE", gui = "strikethrough" },
  CmpItemAbbrMatch = { guifg = "#82AAFF", guibg = "NONE", gui = "bold" },
  CmpItemAbbrMatchFuzzy = { guifg = "#82AAFF", guibg = "NONE", gui = "bold" },
  CmpItemMenu = { guifg = "#C792EA", guibg = "NONE", gui = "italic" },

  CmpItemKindField = { guifg = "#EED8DA", guibg = "#B5585F" },
  CmpItemKindProperty = { guifg = "#EED8DA", guibg = "#B5585F" },
  CmpItemKindEvent = { guifg = "#EED8DA", guibg = "#B5585F" },

  CmpItemKindText = { guifg = "#C3E88D", guibg = "#9FBD73" },
  CmpItemKindEnum = { guifg = "#C3E88D", guibg = "#9FBD73" },
  CmpItemKindKeyword = { guifg = "#C3E88D", guibg = "#9FBD73" },

  CmpItemKindConstant = { guifg = "#FFE082", guibg = "#D4BB6C" },
  CmpItemKindConstructor = { guifg = "#FFE082", guibg = "#D4BB6C" },
  CmpItemKindReference = { guifg = "#FFE082", guibg = "#D4BB6C" },

  CmpItemKindFunction = { guifg = "#EADFF0", guibg = "#A377BF" },
  CmpItemKindStruct = { guifg = "#EADFF0", guibg = "#A377BF" },
  CmpItemKindClass = { guifg = "#EADFF0", guibg = "#A377BF" },
  CmpItemKindModule = { guifg = "#EADFF0", guibg = "#A377BF" },
  CmpItemKindOperator = { guifg = "#EADFF0", guibg = "#A377BF" },

  CmpItemKindVariable = { guifg = "#C5CDD9", guibg = "#7E8294" },
  CmpItemKindFile = { guifg = "#C5CDD9", guibg = "#7E8294" },

  CmpItemKindUnit = { guifg = "#F5EBD9", guibg = "#D4A959" },
  CmpItemKindSnippet = { guifg = "#F5EBD9", guibg = "#D4A959" },
  CmpItemKindFolder = { guifg = "#F5EBD9", guibg = "#D4A959" },

  CmpItemKindMethod = { guifg = "#DDE5F5", guibg = "#6C8ED4" },
  CmpItemKindValue = { guifg = "#DDE5F5", guibg = "#6C8ED4" },
  CmpItemKindEnumMember = { guifg = "#DDE5F5", guibg = "#6C8ED4" },

  CmpItemKindInterface = { guifg = "#D8EEEB", guibg = "#58B5A8" },
  CmpItemKindColor = { guifg = "#D8EEEB", guibg = "#58B5A8" },
  CmpItemKindTypeParameter = { guifg = "#D8EEEB", guibg = "#58B5A8" },
}

for k, v in pairs(hi) do
  vim.highlight.create(k, v)
end

config.setup = function()
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local luasnip = require("luasnip")
  local cmp = require'cmp'

  cmp.setup({
    preselect = cmp.PreselectMode.None,
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
      { name = 'nvim_lsp', keyword_length = 2 },
      { name = 'cmp_tabnine', keyword_length = 3 },
      { name = 'buffer', keyword_length = 3 },
      { name = 'path', keyword_length = 3 },
    },

    view = {
      entries = "native",
    },

    experimental = {
      -- native_menu = true,
      ghost_text = true,
    },

    -- window.documentation= "native"
    -- documentation = {
    --   border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
    -- },
  })

end

return config
