local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp,
}

completion['folke/lsp-trouble.nvim'] = {}

completion['ray-x/lsp_signature.nvim'] = {
  config = conf.lsp_signature,
}

completion['glepnir/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
}

completion['hrsh7th/nvim-compe'] = {
  event = 'InsertEnter',
  config = conf.nvim_compe,
}

completion['onsails/lspkind-nvim'] = {}

completion['rmagatti/goto-preview'] = {
  requires = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('goto-preview').setup{
      width = 120;
      height = 15;
      default_mappings = false;
      --lsp_configs = {
        --go = {
          --get_config = function(data)
            --return data.uri, { data.range.start.line + 1, data.range.start.character }
          --end
        --};
        --lua = {
          --get_config = function(data)
            --return data.targetUri,{ data.targetRange.start.line + 1, data.targetRange.start.character }
          --end
        --};
        --typescript = {
          --get_config = function(data)
            --return data.uri, { data.range.start.line + 1, data.range.start.character }
          --end
        --}
      --}
    }
  end
}

completion['hrsh7th/vim-vsnip'] = {
  event = 'InsertCharPre',
  config = conf.vim_vsnip
}

completion['nvim-telescope/telescope.nvim'] = {
  --cmd = 'Telescope',
  opt = false,
  config = conf.telescope,
  requires = {
    {'nvim-telescope/telescope-dap.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-fzy-native.nvim'},
    {'nvim-telescope/telescope-frecency.nvim'},
    {'tami5/sqlite.lua'}
  }
}

completion['glepnir/smartinput.nvim'] = {
  ft = 'go',
  config = conf.smart_input
}

completion['mattn/vim-sonictemplate'] = {
  cmd = 'Template',
  ft = {'go','typescript','lua','javascript','vim','rust','markdown'},
  config = conf.vim_sonictemplate,
}

completion['mattn/emmet-vim'] = {
  event = 'InsertEnter',
  ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact'},
  config = conf.emmet,
}

return completion
