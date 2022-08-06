local M={}


M.setup = function()
  local navic = require("nvim-navic")
  local autosession = require("auto-session-library")

  local function search_count()
    local search = vim.fn.searchcount({maxcount=0})
    local searchCurrent = search.current
    local searchTotal = search.total

    if searchCurrent == 0 then
      return ""
    end

    return string.format("%d/%d", searchCurrent, searchTotal)
  end

  require('lualine').setup {
    options ={
      -- theme = 'gruvbox'
      theme = 'gruvbox-baby'
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
      },
      lualine_y = {
        { search_count },
        { 'progress' },
      },
    }
  }

  vim.cmd('set laststatus=3')

end

return M


