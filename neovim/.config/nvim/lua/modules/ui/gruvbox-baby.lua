local M = {}

M.setup = function ()
   vim.g.gruvbox_baby_background_color = "dark"
   -- vim.g.gruvbox_baby_telescope_theme = 1
   vim.g.gruvbox_baby_function_style = "NONE"

  vim.cmd[[colorscheme gruvbox-baby]]
  vim.cmd[[hi Folded guibg=#32302f]]
  vim.cmd[[hi DebuggerBreakpoint guifg=#ff0000]]
  vim.cmd[[hi DebuggerBreakpointCondition guifg=#ffa500]]
end
return M
