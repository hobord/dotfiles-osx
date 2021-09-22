local tools = {}
local conf = require('modules.tools.config')

tools['kristijanhusak/vim-dadbod-ui'] = {
  cmd = {'DBUIToggle','DBUIAddConnection','DBUI','DBUIFindBuffer','DBUIRenameBuffer'},
  config = conf.vim_dadbod_ui,
  requires = {{'tpope/vim-dadbod',opt = true}}
}


--tools['vim-delve'] = {}

tools['mfussenegger/nvim-dap'] = {
  config = conf.dap
}

tools['rcarriga/nvim-dap-ui'] = {
  requires = {{'mfussenegger/nvim-dap'}},
  config = conf.dapui
}

tools['vim-test/vim-test'] = {

}

tools['editorconfig/editorconfig-vim'] = {
  ft = { 'go','typescript','javascript','vim','rust','zig','c','cpp' }
}

tools['glepnir/prodoc.nvim'] = {
  event = 'BufReadPre'
}

tools['liuchengxu/vista.vim'] = {
  cmd = 'Vista',
  config = conf.vim_vista
}

tools['simrat39/symbols-outline.nvim'] = {
  config = function ()
    vim.g.symbols_outline = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = 'right',
      width = 25,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      keymaps = {
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "l",
        hover_symbol = "<C-space>",
        toggle_preview = "h",
        rename_symbol = "r",
        code_actions = "a",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "𝓒", hl = "TSType"},
        Method = {icon = "", hl = "TSMethod"},
        Property = {icon = "ﰠ", hl = "TSMethod"},
        Field = {icon = "ﰠ", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
        Interface = {icon = "", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "𝓐", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "", hl = "TSType"},
        Key = {icon = "", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon  = "פּ", hl = "TSType"},
        Event = {icon = "", hl = "TSType"},
        Operator = {icon = "", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    },
  }
  end
}

tools['brooth/far.vim'] = {
  cmd = {'Far','Farp'},
  config = function ()
    vim.g['far#source'] = 'rg'
  end
}

tools['sindrets/diffview.nvim'] = {
  config = function ()
    require'diffview'.setup{}
  end
}
tools['iamcco/markdown-preview.nvim'] = {
  ft = 'markdown',
  config = function ()
    vim.g.mkdp_auto_start = 0
  end
}

tools['kabouzeid/nvim-lspinstall'] = {
  requires = {{'neovim/nvim-lspconfig'}}
}
tools['tpope/vim-git'] = {}
tools['motemen/git-vim'] = {}
tools['tpope/vim-fugitive'] = {}

tools['voldikss/vim-floaterm'] = {}
tools['numtostr/FTerm.nvim'] = {
  config = function () 
	  require("FTerm").setup({
	    dimensions = {
	      height = 0.9,
	      width = 0.9,
	      border = 'single'
	    }
	  })
  end
}

tools['szw/vim-maximizer'] = {}
tools['junegunn/vim-peekaboo'] = {}
tools['Yilin-Yang/vim-markbar'] = {}
tools['mbbill/undotree'] = {}
tools['ThePrimeagen/git-worktree.nvim'] = {
  requires = {{'nvim-telescope/telescope.nvim'}},
  config = function ()
    --require("telescope").load_extension("git_worktree")
  end
}

return tools
