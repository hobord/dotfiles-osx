local config = {}

config.setup = function()
  lsp_status = require('lsp-status')
  lsp_status.config({
    kind_labels = {},
    current_function = true,
    show_filename = true,
    diagnostics = false,
    indicator_separator = ' ',
    component_separator = ' ',
    indicator_errors   = '',
    indicator_warnings = '',
    indicator_info     = '',
    indicator_hint     = '',
    indicator_ok       = '',
    spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'},
    status_symbol = '  ',
    select_symbol = nil,
    update_interval = 100
  })
  lsp_status.register_progress()
end

return config
