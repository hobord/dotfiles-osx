local config = {}

config.setup = function()
  require('bufferline').setup{
    options = {
      modified_icon = '',
      buffer_close_icon = '',
      --mappings = true,
      numbers =  "none", -- | "ordinal" | "buffer_id" | "both" | function
      left_trunc_marker = '',
      right_trunc_marker = '',
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s=""

        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
            or (e == "warning" and " " or "" )
          -- s = s .. n .. sym
          s = s .. sym
        end
        return s
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
      custom_areas = {
        right = function()
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
          return result
        end,
      }
    }
  }
end

return config
