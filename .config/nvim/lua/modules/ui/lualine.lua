local M={}

M.setup = function()
  -- require("modules.ui.gps").setup()
  -- local gps = require("nvim-gps")

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
   --  sections = {
			-- -- lualine_c = {
			-- -- 	{ gps.get_location, cond = gps.is_available },
			-- -- }
   --  }
  }

  vim.cmd('set laststatus=3')

end

return M


