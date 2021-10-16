local config = {}

config.setup = function()
  require('smartinput').setup {
    ['go'] = { ';',':=',';' }
  }

end

return config
