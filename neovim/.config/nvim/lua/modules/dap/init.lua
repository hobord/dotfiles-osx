local config = {}

-- local dap = require "dap"

-- https://github-wiki-see.page/m/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

config.setup = function()
  require('nvim-dap-virtual-text').setup({ enabled = false, enabled_commands = true })
  require('dap.ext.vscode').load_launchjs()
  require('modules.dap.go')
  -- require('modules.dap.node')
  -- require('modules.dap.python')
  -- require('modules.dap.cs')
  require('modules.dap.ui').setup()

  -- dap.defaults.fallback.force_external_terminal = true
  -- dap.defaults.fallback.external_terminal = {
  --   command = "tmux",
  --   args = { "split-pane", "-c", "." },
  -- }
end

return config
