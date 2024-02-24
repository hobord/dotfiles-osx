local dap = require "dap"
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  -- works with go.mod packages and sub packages
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
    args = require('modules.dap.go-utils').make_test_args,
  },
  {
    type = "go",
    name = "Debug File",
    request = "launch",
    mode = "debug",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug Package",
    request = "launch",
    mode = "debug",
    program = "./${relativeFileDirname}",
  },
  {
    type = "go",
    name = "Attach",
    mode = "local",
    request = "attach",
    processId = require('dap.utils').pick_process,
  },
  {
    name = "Launch Remote",
    type = "go",
    request = "attach",
    mode = "remote",
    remotePath = "{remote path}",
    port = 38679,
    host = "{host}",
    cwd = "${workspaceFolder}",
    trace = "verbose",
  }
}

dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local stderr = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local host = config.host or "127.0.0.1"
  local port = config.port or "38697"
  local addr = string.format("%s:%s", host, port)
  local opts = {
    stdio = { nil, stdout, stderr },
    args = { "-v", "--log", "dap", "-l", addr, "--log-dest=3" },
    detached = true
  }

  -- print(vim.inspect(opts))
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    stderr:close()
    if code ~= 0 then
      print('dlv exited with code', code)
    end
  end)

  assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))

  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require('dap.repl').append(chunk)
      end)
    end
  end)

  stderr:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require('dap.repl').append(chunk)
      end)
    end
  end)

  -- Wait for delve to start
  vim.defer_fn(
    function()
      callback({ type = "server", host = host, port = port })
    end,
    100)
end
-- language lua
