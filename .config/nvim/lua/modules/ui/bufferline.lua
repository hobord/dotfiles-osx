local config = {}

config.setup = function()
  require('bufferline').setup{
    options = {
      modified_icon = '',
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
            return 'פּ'--vim.fn.getcwd()
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

return config
