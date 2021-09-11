local config = {}

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.which_key()
  require("which-key").setup{}
end

function config.nvim_bufferline()
  require('bufferline').setup{
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      --mappings = true,
      numbers = "ordinal",
      left_trunc_marker = '',
      right_trunc_marker = '',
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        return "("..count..")"
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = function()
            return vim.fn.getcwd()
          end,
          highlight = "Directory",
          text_align = "left"
        }
      },
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "slant",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = 'extension',
    }
  }
end

function config.dashboard()
  --local home = os.getenv('HOME')
  vim.g.dashboard_footer_icon = '🐬 '
  --vim.g.dashboard_preview_command = 'cat'
  --vim.g.dashboard_preview_pipeline = 'lolcat -F 0.3'
  --vim.g.dashboard_preview_file = home .. '/.config/nvim/static/neovim.cat'
  --vim.g.dashboard_preview_file_height = 12
  --vim.g.dashboard_preview_file_width = 80
  vim.g.dashboard_default_executive = 'telescope'
  vim.g.dashboard_custom_section = {
    last_session = {
      description = {'  Recently laset session                  SPC s l'},
      command =  'SessionLoad'},
    find_history = {
      description = {'  Recently opened files                   SPC f h'},
      command =  'DashboardFindHistory'},
    find_file  = {
      description = {'  Find  File                              SPC f f'},
      command = 'Telescope find_files find_command=rg,--hidden,--files'},
    new_file = {
     description = {'  File Browser                            SPC f b'},
     command =  'Telescope file_browser'},
    find_word = {
     description = {'  Find  word                              SPC f w'},
     command = 'DashboardFindWord'},
    --find_dotfiles = {
     --description = {'  Open Personal dotfiles                  SPC f d'},
     --command = 'Telescope dotfiles path=' .. home ..'/.dotfiles'},
    --go_source = {
     --description = {'  Find Go Source Code                     SPC f s'},
     --command = 'Telescope gosource'},
  }
end

function config.nvim_tree()
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_auto_open = 1
  vim.g.nvim_tree_lsp_diagnostics = 1
  --vim.g.nvim_tree_bindings = {
    --["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
    --["s"] = ":lua require'nvim-tree'.on_keypress('vsplit')<CR>",
    --["i"] = ":lua require'nvim-tree'.on_keypress('split')<CR>",
  --}
  vim.g.nvim_tree_icons = {
    default =  '',
    symlink =  '',
    git = {
     unstaged = "✚",
     staged =  "✚",
     unmerged =  "≠",
     renamed =  "≫",
     untracked = "★",
    },
  }
  require'nvim-tree.events'.on_nvim_tree_ready(function ()
    vim.cmd("NvimTreeRefresh")
  end)
end

function config._gitsigns()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
  end
  require('gitsigns').setup {
    current_line_blame = true,
    signs = {
      add = {hl = 'GitGutterAdd', text = '▋'},
      change = {hl = 'GitGutterChange',text= '▋'},
      delete = {hl= 'GitGutterDelete', text = '▋'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    },
    keymaps = {
       -- Default keymap options
       noremap = true,
       buffer = true,

       ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
       ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

       ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
       ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
       ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
       ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
       ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

       -- Text objects
       ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
       ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
     },
  }
end


function config.gruvbox_flat()
  --vim.g.gruvbox_flat_style = "dark"
  vim.g.gruvbox_flat_style = "hard"
  vim.g.gruvbox_italic_functions = true
  vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer", "nvimtree" }

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

  -- Load the colorscheme
  vim.cmd[[colorscheme gruvbox-flat]]
end

return config
