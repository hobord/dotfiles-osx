local M = {}

local parser = require "modules.tools.gotest.parser"

local lastRun = {
  testname = "",
  return_val = 0,
  result = {},
  path = "",
}

local function run(testname, path)
  local Job = require'plenary.job'
  local notify = require("notify")
  local async = require("plenary.async")

  Job:new({
    command = 'go',
    args = { 'test', '-count=1', '-v', '-run', '^' .. testname .. '$', path},
    cwd = vim.fn.expand('%:p:h'),
    on_exit = function(j, return_val)
      -- print(vim.inspect.inspect(j:result()))

      local title = "info"
      if return_val == 0 then
        title = "success"
      else
        title = "error"
      end

      async.run(function()
        notify({ title }, title, {
          title = testname,
          timeout = 5000,
        })
      end)

      lastRun = {
        testname = testname,
        return_val = return_val,
        result = j:result(),
      }
    end,
  }):sync() -- or start()

end

M.RunLastTest = function ()
  if lastRun.testname == "" then
    return
  end

  run(lastRun.testname, lastRun.path)
end

M.RunTest = function ()
  local testname = parser.getFnName()
  local path = vim.fn.expand('%:p:h')

  if testname == "" then
    return
  end

  run(testname, path)

  lastRun.path = path
end

M.ShowLastTestReults = function ()
  local Popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event

  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
    },
    position = "50%",
    size = {
      width = "80%",
      height = "60%",
    },
  })

  -- mount/open the component
  popup:mount()

  -- unmount component when cursor leaves buffer
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)

  local content = lastRun.result

  -- set content
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, content)
end

return M

