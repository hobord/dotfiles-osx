local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local buffer = require('galaxyline.provider_buffer')
local gls = gl.section
local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gl.short_line_list = {'NvimTree','vista','dbui','packer','symbols_outline'}

local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
                    [''] = colors.blue,V=colors.blue,
                    c = colors.magenta,no = colors.red,s = colors.orange,
                    S=colors.orange,[''] = colors.orange,
                    ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                    cv = colors.red,ce=colors.red, r = colors.cyan,
                    rm = colors.cyan, ['r?'] = colors.cyan,
                    ['!']  = colors.red,t = colors.red}

--gls.left[1] = {
  --RainbowRed = {
    --provider = function() return '▊ ' end,
    --highlight = {colors.blue,colors.bg}
  --},
--}
--gls.left[2] = {
  --BufNo = {
    --provider = buffer.get_buffer_number,
    --highlight = {colors.blue,colors.bg,'bold'},
  --},
--}
gls.left[3] = {
  ViMode = {
    provider = function()
      local mode_icons = {
        n = "", i = "", v = "",
        [''] = "", V="", 
        c = "", no = "", s = "", 
        S="", [''] = "", 
        ic = "", R = "", Rv = "", 
        cv = "", ce="",  r = "", 
        rm = "",  ['r?'] = "", 
        ['!']  = "", t = ""
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()] ..' guibg='..colors.bg)
      return "▊ "..mode_icons[vim.fn.mode()]..': ' -- 
    end,
  },
}
gls.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}
gls.left[6] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}
gls.left[7] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.left[8] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
  }
}
gls.left[9] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.orange,colors.bg},
  }
}
gls.left[11] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

gls.mid[0] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.mid[1] = {
  ShowLspClient = {
    --provider = 'GetLspClient',
    provider = function ()
      local msg = '  '
      local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
      local clients = vim.lsp.get_active_clients()

      if next(clients) == nil then
        return msg
      end

      for _,client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
          msg = '  '-- client.name
        end
      end

      return msg
    end,
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    --icon = ' : ',
    highlight = {colors.yellow,colors.bg,'bold'}
  }
}
gls.mid[3] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.mid[4] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.mid[5] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.mid[6] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}
gls.mid[7] = {
  ShowVistaInfo = {
    provider = 'VistaPlugin',
    highlight = {colors.yellow,colors.bg,'bold'}
  }
}

gls.right[0] = {
  WhiteSpace = {
    provider = 'WhiteSpace',
  }
}
gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}
gls.right[4] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}
gls.right[5] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}
gls.right[6] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}

gls.right[7] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg}
  }
}

gls.right[8] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {colors.bg,colors.bg}
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
