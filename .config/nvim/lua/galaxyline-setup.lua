
local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui', "minimap", "nerdtree"}

local colors = {
  bg = '#282828',
  black = '#000000',
  yellow = '#d79921',
  cyan = '#008080',
  darkblue = '#458488',
  green = '#98971a',
  orange = '#d65d0e',
  purple = '#b16286',
  magenta = '#d16d9e',
  grey = '#a89984',
  blue = '#83a598',
  red = '#cc241d',

    dark0_hard  = '#1d2021',
    dark0       = '#282828',
    dark0_soft  = '#32302f',
    dark1       = '#3c3836',
    dark2       = '#504945',
    dark3       = '#665c54',
    dark4       = '#7c6f64',
    dark4_256   = '#7c6f64',

    gray_245    = '#928374',
    gray_244    = '#928374',

    light0_hard = '#f9f5d7',
    light0      = '#fbf1c7',
    light0_soft = '#f2e5bc',
    light1      = '#ebdbb2',
    light2      = '#d5c4a1',
    light3      = '#bdae93',
    light4      = '#a89984',
    light4_256  = '#a89984',

    bright_red     = '#fb4934',
    bright_green   = '#b8bb26',
    bright_yellow  = '#fabd2f',
    bright_blue    = '#83a598',
    bright_purple  = '#d3869b',
    bright_aqua    = '#8ec07c',
    bright_orange  = '#fe8019',

    neutral_red    = '#cc241d',
    neutral_green  = '#98971a',
    neutral_yellow = '#d79921',
    neutral_blue   = '#458588',
    neutral_purple = '#b16286',
    neutral_aqua   = '#689d6a',
    neutral_orange = '#d65d0e',

    faded_red      = '#9d0006',
    faded_green    = '#79740e',
    faded_yellow   = '#b57614',
    faded_blue     = '#076678',
    faded_purple   = '#8f3f71',
    faded_aqua     = '#427b58',
    faded_orange   = '#af3a03'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function() return '▋' end,
    highlight = {colors.dark2,colors.dark2}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',v= 'VISUAL',V= 'VISUAL-L', [''] = 'VISUAL-B'}
      return alias[vim.fn.mode()]
    end,
    separator = '',
    separator_highlight = {colors.dark2,function()
      if not buffer_not_empty() then
        return colors.dark2
      end
      return colors.light4
    end},
    highlight = {colors.bright_yellow,colors.dark2,'bold'},
  },
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.light4},
  },
}
gls.left[4] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = buffer_not_empty,
    separator = '',
    separator_highlight = {colors.dark2,colors.light4},
    highlight = {colors.black,colors.light4}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = buffer_not_empty,
    highlight = {colors.orange,colors.dark2},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.dark2},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.dark2},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange,colors.dark2},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.dark2},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.dark2,colors.bg},
    highlight = {colors.dark2,colors.dark2}
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[12] = {
  Space = {
    provider = function () return ' ' end
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}
gls.right[1]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = '',
    separator_highlight = {colors.bg,colors.dark2},
    highlight = {colors.grey,colors.dark2},
  }
}
gls.right[2] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.dark2},
    highlight = {colors.grey,colors.dark2},
  },
}
gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {colors.dark3,colors.dark2},
    highlight = {colors.grey,colors.dark3},
  }
}
gls.right[4] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow,colors.dark2},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.dark2,colors.bg},
    highlight = {colors.grey,colors.dark2}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    separator_highlight = {colors.dark2,colors.bg},
    highlight = {colors.grey,colors.dark2}
  }
}
