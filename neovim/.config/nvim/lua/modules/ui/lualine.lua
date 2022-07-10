local M={}


M.setup = function()
  -- require("modules.ui.gps").setup()
  -- local gps = require("nvim-gps")
  local navic = require("nvim-navic")
  local autosession = require("auto-session-library")

  require('lualine').setup {
    options ={
      theme = 'gruvbox'
    },
    disabled_filetypes = {
      "NvimTree",
      "Outline",
      "packer",
      "dbui",
      "neo-tree",
    },
    globalstatus = true,
    sections = {
      lualine_c = {
        {
            autosession.current_session_name
        },
        {
          'filename',
          path = 1,
        },
        { navic.get_location, cond = navic.is_available },
        -- { gps.get_location, cond = gps.is_available },
      },
    }
  }

  vim.cmd('set laststatus=3')

end

return M


