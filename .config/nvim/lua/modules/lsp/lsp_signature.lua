local config = {}

config.setup = function()
  require('lsp_signature').on_attach({
    bind = true,
    handler_opts = {
      border = "single",
      floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
      fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
      hint_enable = true, -- virtual hint enable
      hint_prefix = " ",  -- Panda for parameter
      hint_scheme = "String",
      use_lspsaga = false,  -- set to true if you want to use lspsaga popup
      hi_parameter = "Search", -- how your parameter will be highlight
      max_width = 120,
      toggle_key = '<M-x>', -- nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    },
  })

end

return config
