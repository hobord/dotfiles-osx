local M = {}

function GetCurrentDiagnostic()
  bufnr = 0
  line_nr = vim.api.nvim_win_get_cursor(0)[1] - 1
  opts = { ["lnum"] = line_nr }

  local line_diagnostics = vim.diagnostic.get(bufnr, opts)
  if vim.tbl_isempty(line_diagnostics) then
    return
  end

  local best_diagnostic = nil

  for _, diagnostic in ipairs(line_diagnostics) do
    if best_diagnostic == nil or diagnostic.severity < best_diagnostic.severity
    then
      best_diagnostic = diagnostic
    end
  end

  return best_diagnostic
end

function GetCurrentDiagnosticString()
  local diagnostic = GetCurrentDiagnostic()

  if not diagnostic or not diagnostic.message then
    return
  end

  local message = vim.split(diagnostic.message, "\n")[1]
  local max_width = vim.api.nvim_win_get_width(0) - 35

  if string.len(message) < max_width then
    return message
  else
    return string.sub(message, 1, max_width) .. "..."
  end
end

M.setup = function()
  -- local navic = require("nvim-navic")
  require('lualine').setup {
    options = {
      -- theme = 'gruvbox'
      -- theme = 'gruvbox-baby'
      theme = 'gruvbox-material'
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
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff' },
      lualine_c = {
        {
          require('auto-session.lib').current_session_name
        },
        {
          'filename',
          path = 1,
        },
        -- { navic.get_location, cond = navic.is_available },
      },
      lualine_x = {
        "GetCurrentDiagnosticString()",
        "diagnostics",
        'encoding', 'fileformat', 'filetype'
      },
      lualine_y = {
        "searchcount",
        'progress',
      },
    }
  }

  vim.cmd('set laststatus=3')
end

return M
