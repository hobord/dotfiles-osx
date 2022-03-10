local config = {}

config.setup = function()
  vim.g.gruvbox_flat_style = "hard"
  vim.g.gruvbox_italic_functions = true
  vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer", "nvimtree" }

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

  -- Load the colorscheme
  vim.cmd[[colorscheme gruvbox-flat]]
  vim.cmd[[hi Folded guibg=#32302f]]
  vim.cmd[[hi DebuggerBreakpoint guifg=#ff0000]]
  vim.cmd[[hi DebuggerBreakpointCondition guifg=#ffa500]]
end

return config

