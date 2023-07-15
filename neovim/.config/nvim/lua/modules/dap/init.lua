local config = {}

-- https://github-wiki-see.page/m/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

config.setup = function()
  require('nvim-dap-virtual-text').setup({enabled = false, enabled_commands=true})
  require('modules.dap.go')
  -- require('modules.dap.node')
  -- require('modules.dap.python')
  -- require('modules.dap.cs')
  require('modules.dap.ui').setup()

end

return config

