local M = {}
--          
--
--     wal.go   WalRecord   Data
local bg_inactive = "#1e2021"
-- local bg_active = "#171819"
local bg_active = "#404040"
local fg_active = "#d5be97"

vim.api.nvim_set_hl(0, "WinBarNC", { fg = bg_inactive, bg = bg_inactive }) -- Window bar of not-current windows.
vim.api.nvim_set_hl(0, "WinBar", { fg = fg_active, bg = bg_active }) -- Window bar of current window.
vim.api.nvim_set_hl(0, "WinBarContent", { bg = bg_active })
vim.api.nvim_set_hl(0, "WinBarInverse", { fg = bg_active, bg = fg_active })
vim.api.nvim_set_hl(0, "WinBarInverseNC", { fg = bg_active, bg = nil })

local winbar_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "neo-tree",
  "NeoTree",
  "NvimTree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
  "aerial",
}

local winbar_filename_excluded = {
  "leftpad",
  "rightpad",
}


local function isempty(s)
  return s == nil or s == ""
end

local is_current = function()
  local winid = vim.g.actual_curwin
  if isempty(winid) then
    return false
  else
    return winid == tostring(vim.api.nvim_get_current_win())
  end
end


function M.get_file_icon(filename) -- Get file icon
  local extension = ""
  local file_icon = ""
  local file_icon_color = ""
  local default_file_icon = ""
  local default_file_icon_color = ""
  local default = false

  extension = vim.fn.expand "%:e"


  if isempty(extension) then
    extension = ""
    default = true
  end

  file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = default })

  local hl_group = "FileIconColor" .. extension

  vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color, bg = bg_active })
  if file_icon == nil then
    file_icon = default_file_icon
    file_icon_color = default_file_icon_color
  end

  return "%#" .. hl_group .. "#" .. file_icon .. "%*"

end

function M.filename()
  local filename = vim.fn.expand "%:t"

  if not isempty(filename) then

    local res = "%#WinBarContent#" .. "%m" .. "%*" ..
        "%#WinBarContent# " .. filename .. " %*"

    if is_current() then
      res = res .. "%#WinBarContent#" .. " " .. "%*"
    else
      res = res .. "%#WinBarInverseNC#" .. "" .. "%*"
    end

    return res
    -- "  " .. "%*"
  end

  return ""
end

function M.navic()
  local navic = require "nvim-navic"
  local location = navic.get_location()

  if location == nil then
    return ""
  end

  return location
end

function M.right()
  local results = {}

  local s = '  '
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      s = '  ' -- client.name
    end
  end

  table.insert(results, { text = s, guifg = "#7EA9A7" })
  local error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warning = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  local hint = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

  if error ~= 0 then
    table.insert(results, { text = "  " .. error, guifg = "#EC5241" })
  end

  if warning ~= 0 then
    table.insert(results, { text = "  " .. warning, guifg = "#EFB839" })
  end

  if hint ~= 0 then
    table.insert(results, { text = "  " .. hint, guifg = "#A3BA5E" })
  end

  if info ~= 0 then
    table.insert(results, { text = "  " .. info, guifg = "#7EA9A7" })
  end

  -- for _, v in ipairs(result) do
  --   vim.api.nvim_command("hi WinBarRight" .. v.text .. " guifg=" .. v.guifg)
  --  end
  -- return result
  return ""
end

function M.statusline()
  -- if vim.api.nvim_eval_statusline("%f", {})["str"] == "[No Name]" then
  --   return ""
  -- end

  if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
    return ""
  end

  if vim.tbl_contains(winbar_filename_excluded, vim.fn.expand "%:t") then
    return ""
  end

  return ""
      .. M.filename()
      .. M.navic()
      .. "%="
  -- .. "%#WinBarContent#"
  -- .. M.right()
  -- .. " %-m "
  -- .. "%t "
end

return M
