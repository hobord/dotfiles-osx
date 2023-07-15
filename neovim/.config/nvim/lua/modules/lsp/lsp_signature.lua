local config = {}

config.setup = function()
  require('lsp_signature').setup({
    bind = true,
    floating_window_above_cur_line = false,
    hint_prefix = " ",  -- Panda for parameter
    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    fix_pos = true,  -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    hint_scheme = "String",
    use_lspsaga = false,  -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    max_width = 120,
    toggle_key = '<M-x>', -- nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
   -- floating_window_off_x = 5, -- adjust float windows x position.
   floating_window_off_y = -2, -- adjust float windows y position.
 
    handler_opts = {
      border = "single",
    },
  })

    vim.api.nvim_command('augroup lsp_signature')
    vim.api.nvim_command('autocmd!')
    vim.api.nvim_command('autocmd BufWinEnter * :lua require "lsp_signature".on_attach()')
    vim.api.nvim_command('augroup END')
end

return config
