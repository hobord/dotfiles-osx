local config = {}

config.setup = function()
  require("zen-mode").setup {
    window = {
      width = 0.70,
      options = {
        list = false,
        wrap = false,
        relativenumber = false,
        foldcolumn = "0",
      }
    },
    plugins = {
      options = {
        enabled = true,
        list = false,
        wrap = false,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
        colorcolumn = 0,
      },
      twilight = { enabled = false },
      diagnostics = { enabled = true },
    },
    on_open = function(_win)
      require('gitsigns').detach()
    end,

    on_close = function(_win)
      require('gitsigns').attach()
    end,
  }
end

return config

