local config = {}

config.setup = function()
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  _G.enhance_nice_block = function (key)
    if not packer_plugins['vim-niceblock'].loaded then
      vim.cmd [[packadd vim-niceblock]]
    end
    local map = {
      I = '<Plug>(niceblock-I)',
      ['gI'] = '<Plug>(niceblock-gI)',
      A = '<Plug>(niceblock-A)'
    }
    return t(map[key])
  end

end

return config
