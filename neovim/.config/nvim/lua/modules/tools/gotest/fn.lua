local M = {}

local lastRun = {
  testname = "",
  return_val = 0,
  result = {},
  path = "",
}

local ts_utils = require'nvim-treesitter.ts_utils'

local getFnName = function ()
  local current_node = ts_utils.get_node_at_cursor()
  if not current_node then return "" end

  local expr = current_node

  while expr do
      if expr:type() == 'function_declaration' then
          break
      end
      expr = expr:parent()
  end

  if not expr then return "" end

  return (ts_utils.get_node_text(expr:child(1)))[1]
end

M.getTestFnName = function ()
  local fnName = getFnName()

  local i, _ = string.find(fnName, "Test")
  if i == 1 then
    return fnName
  end

  return ""
end


local function run(testname, path)
  local Job = require'plenary.job'
  local notify = require("notify")
  local async = require("plenary.async")

  -- async.run(function()
  --   notify({ "Start" }, "info", {
  --     title = testname,
  --     timeout = 100,
  --   })
  -- end)

  -- go test -count=1 -timeout 5m -run -v  "^NameOfTest$" ./path
  Job:new({
    command = 'go',
    args = { 'test', '-count=1', '-v', '-run', '^' .. testname .. '$', path},
    cwd = vim.fn.expand('%:p:h'),
    -- env = { ['a'] = 'b' },
    on_exit = function(j, return_val)
      -- print(vim.inspect.inspect(j:result()))
      -- result = j:result()

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
  local testname = getFnName()
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

