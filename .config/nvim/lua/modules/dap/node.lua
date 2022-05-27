local dap = require "dap"
--
-- run DIInstall jsnode before use
--
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {
        vim.fn.stdpath("data") .. "/dapinstall/jsnode/" ..
            '/vscode-node-debug2/out/src/nodeDebug.js'
    }
}

dap.configurations.javascript = {
  {
    name       = "Exec",
    type       = 'node2',
    request    = 'launch',
    program    = '${workspaceFolder}/${file}',
    cwd        = vim.fn.getcwd(),
    sourceMaps = true,
    protocol   = 'inspector',
    console    = 'integratedTerminal'
  },
  {
    name       = "Attach",
    type       = 'node2',
    request    = "attach",
    port       = 6053,
    -- cwd        = vim.fn.getcwd(),
    -- sourceMaps = true,
    protocol   = 'inspector',
    console    = 'integratedTerminal'
  }
}
