local M = {}
local vi_mode_utils = require('feline.providers.vi_mode')


M.setup = function()
  local components = require('feline.presets')['default']

  -- local lsp = require("feline.providers.lsp")
  -- local gps = require("nvim-gps")
  -- gps.setup()
  -- local devicons = require("nvim-web-devicons")
  -- local my_theme = {
  --   red = '#FF0000',
  --   green = '#00FF00',
  --   blue = '#0000FF',
  --   skyblue = '#FF9000',
  -- }
  -- require('feline').use_theme(my_theme)

  components.active[1][1].hl.fg = 'orange'
  components.active[1][3].hl.bg = 'orange'
  components.active[1][3].hl.fg = 'black'
  components.active[1][3].left_sep = {
    'slant_left_2',
    { str = ' ', hl = { bg = 'orange', fg = 'NONE' } },
  }
  components.active[1][3].right_sep = {
    { str = ' ', hl = { bg = 'orange', fg = 'NONE' } },
    'slant_right_2',
    ' ',
  }

  -- Nvim-GPS
-- if gps then
--   table.insert(components.active[1], {
--     provider = function()
--       local text = gps.get_location()
--       if #text ~= 0 then
--         return '> '..text
--       else
--         return ''
--       end
--     end,
--     enabled = function() return gps.is_available() end,
--     right_sep = function() return { str = ' ', hl = 'orange' } end,
--     hl = function() return 'orange' end
--   })
-- end

--
--

  require('feline').setup({
    force_inactive = {
      filetypes = {
        "NvimTree",
        "Outline",
        "packer",
        "dbui",
        "neo-tree",
      },
      buftypes = {},
      bufnames = {},
    },
    components = components,
  })

end

return M
