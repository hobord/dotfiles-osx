local M = {}

-- local colors = require "config.colors"

-- local status_gps_ok, gps = pcall(require, "nvim-gps")
-- if not status_gps_ok then
--   return
-- end
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

function M.filename()
  local filename = vim.fn.expand "%:t"
  local extension = ""
  local file_icon = ""
  local file_icon_color = ""
  local default_file_icon = ""
  local default_file_icon_color = ""

  if not isempty(filename) then
    extension = vim.fn.expand "%:e"

    local default = false

    if isempty(extension) then
      extension = ""
      default = true
    end

    file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = default })

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color, bg = "#171819" })
    if file_icon == nil then
      file_icon = default_file_icon
      file_icon_color = default_file_icon_color
    end

    -- return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
    return "%#WinBarContent#" .. "  %*" .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. "%#WinBarContent# " .. filename  .. "  " .. "%*"
  end
end

function M.navic()
  local navic = require "nvim-navic"
  local location =  navic.get_location()

  return location
end

function M.right()
  local result = {}

  local s = '  '
  local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
  local clients = vim.lsp.get_active_clients()

  for _,client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
      s = '  ' -- client.name
    end
  end

  table.insert(result,{text=s, guifg="#7EA9A7"})
  local error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warning = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  local hint = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

  if error ~= 0 then
    table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
  end

  if warning ~= 0 then
    table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
  end

  if hint ~= 0 then
    table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
  end

  if info ~= 0 then
    table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
  end

  -- for _, v in ipairs(result) do
  --   vim.api.nvim_command("hi WinBarRight" .. v.text .. " guifg=" .. v.guifg)
  -- end
  -- return result
  return ""
end


vim.api.nvim_set_hl(0, "WinBarNC", {fg="#1e2021", bg = "#1e2021" })
vim.api.nvim_set_hl(0, "WinBar", {  fg="#d5be97", bg = "#171819" })
vim.api.nvim_set_hl(0, "WinBarSeparator", { bg = "#171819" })
vim.api.nvim_set_hl(0, "WinBarContent", { bg = "#171819" })
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

function M.statusline()
  -- if vim.api.nvim_eval_statusline("%f", {})["str"] == "[No Name]" then
  --   return ""
  -- end

  if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
    return ""
  end

  return ""
    .. M.filename()
    .. M.navic()
    -- .. "         "
    .. "%="
    .. M.right()
    -- .. "%#WinBarSeparator#"
    -- .. ""
    -- .. "%#WinBarContent#"
    -- .. " %-m "
    -- .. "%t "
end

return M
