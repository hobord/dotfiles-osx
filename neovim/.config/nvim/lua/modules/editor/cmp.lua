local config = {}
config.setup = function()
  -- local hi = {
  -- PmenuSel = { bg = "#282C34", fg = "NONE" },
  -- Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
  --
  -- CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
  -- CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
  -- CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
  -- CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },
  --
  -- CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
  -- CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  -- CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
  --
  -- CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
  -- CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
  -- CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
  --
  -- CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
  -- CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  -- CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
  --
  -- CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  -- CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
  -- CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
  -- CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
  -- CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
  --
  -- CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  -- CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
  --
  -- CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
  -- CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  -- CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
  --
  -- CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
  -- CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
  -- CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
  --
  -- CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
  -- CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
  -- CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
  -- }

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local luasnip = require("luasnip")
  local cmp = require 'cmp'

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
      fields = { "kind", "abbr", "menu" },

      format = function(entry, vim_item)
        vim_item.kind = require("lspkind").presets.default[vim_item.kind]
        -- .. " "
        -- .. vim_item.kind
        -- set a name for each source
        vim_item.menu = ({
          buffer      = "  ",
          nvim_lsp    = "  ",
          nvim_lua    = "  ",
          path        = "  ",
          luasnip     = "  ",
          cmp_tabnine = "  ",
          copilot     = " ﯙ ",
        })[entry.source.name]

        if string.len(vim_item.abbr) > 25 then
          vim_item.abbr = string.sub(vim_item.abbr, 1, 25) .. "..."
        end

        return vim_item
      end,
      -- format = require "lspkind".cmp_format {
      --   with_text = false,
      --   mode = 'symbol',
      --   maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      --   ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      --   menu = {
      --     buffer      = "  ",
      --     nvim_lsp    = "  ",
      --     nvim_lua    = "  ",
      --     path        = "  ",
      --     luasnip     = "  ",
      --     cmp_tabnine = "  ",
      --     copilot     = " ﯙ ",
      --   },
      -- },
    },

    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.

      ['<C-Space>'] = cmp.mapping.complete(),

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
      end, { "i", "s" }),

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
      { name = 'copilot', keyword_length = 1 },
      { name = 'luasnip', keyword_length = 2 },
      { name = 'nvim_lsp', keyword_length = 2 },
      { name = 'cmp_tabnine', keyword_length = 3 },
      { name = 'buffer', keyword_length = 3 },
      { name = 'path', keyword_length = 3 },
    },

    sorting = {
      priority_weight = 2,
      comparators = {
        require("copilot_cmp.comparators").prioritize,
        require("copilot_cmp.comparators").score,

        -- Below is the default comparitor list and order for nvim-cmp
        cmp.config.compare.offset,
        -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },

    -- view = {
    --   entries = "native",
    -- },

    experimental = {
      -- native_menu = true,
      -- ghost_text = true,
    },

    -- window.documentation= "native",
    window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    },
  })

  -- for k, v in pairs(hi) do
  --   vim.api.nvim_set_hl(0, k, v)
  -- end
  --
  cmp.event:on("menu_opened", function()
    vim.b.copilot_suggestion_hidden = true
  end)

  cmp.event:on("menu_closed", function()
    vim.b.copilot_suggestion_hidden = false
  end)
end

return config
