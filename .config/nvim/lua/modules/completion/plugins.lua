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

--completion["hrsh7th/nvim-cmp"] = {
  --event = "InsertEnter", -- for lazyload
  --requires = {
    --{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
    --{ "f3fora/cmp-spell", after = "nvim-cmp" },
    --{ "hrsh7th/cmp-path", after = "nvim-cmp" },
    --{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
    --{ "hrsh7th/cmp-calc", after = "nvim-cmp" },
    --{ "quangnguyen30192/cmp-nvim-ultisnips", after = "nvim-cmp" },
  --},
  --config = function()
    --local cmp = require'cmp'
    --cmp.setup({
    --snippet = {
      --expand = function(args)
        ---- For `vsnip` user.
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

        ---- For `luasnip` user.
        ---- require('luasnip').lsp_expand(args.body)

        ---- For `ultisnips` user.
        ---- vim.fn["UltiSnips#Anon"](args.body)
      --end,
    --},
    --mapping = {
      --['<C-d>'] = cmp.mapping.scroll_docs(-4),
      --['<C-f>'] = cmp.mapping.scroll_docs(4),
      --['<C-Space>'] = cmp.mapping.complete(),
      --['<C-e>'] = cmp.mapping.close(),
      --['<CR>'] = cmp.mapping.confirm({ select = true }),
    --},
    --sources = {
      --{ name = 'nvim_lsp' },

      ---- For vsnip user.
      --{ name = 'vsnip' },

      ---- For luasnip user.
      ---- { name = 'luasnip' },

      ---- For ultisnips user.
      ---- { name = 'ultisnips' },

      --{ name = 'buffer' },
      --{ name = 'path' },
    --}
  --})
  --end,
--}

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
