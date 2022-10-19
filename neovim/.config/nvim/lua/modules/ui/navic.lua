local M = {}

M.setup = function()
  local navic = require("nvim-navic")

  vim.g.navic_silence = true
  navic.setup({
    separator = "  ",
   })

end

return M
