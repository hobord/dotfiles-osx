local config = {}

config.setup = function()
  vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged  = "✚",
      staged    = "",
      unmerged  = "",
      renamed   = "➜",
      untracked = "★",
      deleted   = "",
      ignored   = "◌",
    },
    folder = {
      arrow_open   = "",
      arrow_closed = "",
      default      = "",
      open         = "",
      empty        = "",
      empty_open   = "",
      symlink      = "",
      symlink_open = "",
    },
    lsp = {
      hint    = "",
      info    = "",
      warning = "",
      error   = "",
    }
  }

  require'nvim-tree'.setup {
    indent_markers = 1,
    follow = 1,
    diagnostics = {
      enable = 1,
    }
  }

  require'nvim-tree.events'.on_nvim_tree_ready(function ()
    vim.cmd("NvimTreeRefresh")
  end)

end

return config

