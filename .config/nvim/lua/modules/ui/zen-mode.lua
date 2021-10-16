local config = {}

config.setup = function()
  require("zen-mode").setup {
    window = {
      options = {
        list = false,
        wrap = false,
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
      gitsigns = { enabled = true },
    }
  }
end

return config

