local config = {}

config.setup = function()
  require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = {"<CR>", "<2-LeftMouse>"},
      open   = "o",
      remove = "d",
      edit   = "e",
      repl   = "r",
    },
    sidebar = {
      elements = {
         -- Provide as ID strings or tables with "id" and "size" keys
        { id = "scopes",      size = 0.25 },
        { id = "watches",     size = 0.25 },
        { id = "stacks",      size = 0.25 },
        { id = "breakpoints", size = 0.25 },
      },
      --width = 80,
      size = 40,
      position = "right", -- Can be "left" or "right"
    },
    tray = {
      -- open_on_start = true,
      elements = {
        "repl"
      },
      size = 10,
      position = "bottom" -- Can be "bottom" or "top"
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil,   -- Floats will be treated as percentage of your screen.
      mappings = {
        close = { "q", "<Esc>" },
      },
    }
  })

  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after['event_initialized']["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before['event_terminited']["dapui_config"] = function()
    dapui.close()
  end
  -- dap.listeners.before['event_exited']["dapui_config"] = function()
  --   dapui.close()
  -- end


  vim.fn.sign_define('DapBreakpoint', {text='', texthl='DebuggerBreakpoint', linehl='', numhl=''})
  vim.fn.sign_define('DapStopped', {text='', texthl='DebuggerBreakpoint', linehl='', numhl=''})
  vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DebuggerBreakpointCondition', linehl='', numhl=''})

  vim.cmd("hi DebuggerBreakpoint guifg='#ff0000'")
  vim.cmd("hi DebuggerBreakpointCondition guifg='#ffa500'")
end

return config


