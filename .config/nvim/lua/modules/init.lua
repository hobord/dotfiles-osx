-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Buffer line
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = require('modules.ui.bufferline').setup,
  }

  -- conext info in footer
  --use {
    --"SmiteshP/nvim-gps",
    --requires = {'nvim-treesitter/nvim-treesitter'},
    --config = require('modules.ui.gps').setup,
  --}


  -- Footer line with info
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = {
      {'kyazdani42/nvim-web-devicons'},
      --{"SmiteshP/nvim-gps"},
    },
    config = require('modules.ui.galaxyline').setup,
  }

  -- Tree file manager
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = require('modules.ui.nvim-tree').setup,
    cmd = {'NvimTreeToggle','NvimTreeOpen'},
  }

  use {
    'ThePrimeagen/harpoon',
    requires = {'nvim-lua/plenary.nvim'},
  }
  -- Guide lines for ident
  use {
    'glepnir/indent-guides.nvim',
    event = 'BufRead',
  }

  -- Git signals right side
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim', opt=true},
    config = require('modules.ui.gitsigns').setup,
  }

  -- Keystrokes/mappings helper
  use {
    'folke/which-key.nvim',
    config = require('modules.ui.which-key').setup,
  }

  use 'junegunn/vim-peekaboo'
  use 'Yilin-Yang/vim-markbar'

  use {
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup({})
    end
  }

  -- Zen mode
  use {
    'folke/zen-mode.nvim',
    config = require('modules.ui.zen-mode').setup,
  }

  -- Colorschemes
  use {
    'eddyekofo94/gruvbox-flat.nvim',
    config = require('modules.ui.gruvbox-flat').setup,
  }
  --use 'rmehri01/onenord.nvim'
  --'glepnir/zephyr-nvim'
  --'gruvbox-community/gruvbox'
  --'folke/tokyonight.nvim'
  --'EdenEast/nightfox.nvim'
  --'Murtaza-Udaipurwala/gruvqueen'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'},
      {'nvim-telescope/telescope-frecency.nvim'},
      {'tami5/sqlite.lua'},
      {'nvim-telescope/telescope-dap.nvim'},
    },
    config = require('modules.ui.telescope').setup,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    after = 'telescope.nvim',
    config = require('modules.treesitter').setup,
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
  }

  -- ---------------------------------------------
  -- LSP
  -- ---------------------------------------------

  use {
    'neovim/nvim-lspconfig',
    config = require('modules.lsp.lspconfig').setup,
    --event = 'BufReadPre',
  }

  use {
    'williamboman/nvim-lsp-installer',
    requires = { {'neovim/nvim-lspconfig'} }
  }

  use {
    'onsails/lspkind-nvim',
    config = require('modules.lsp.lspkind').setup,
  }

  use {
    'folke/lsp-trouble.nvim',
    config = require('modules.lsp.lsp-trouble').setup,
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = require('modules.lsp.lsp_signature').setup,
    --after = 'glepnir/lspsaga.nvim',
  }

  use {
    'simrat39/symbols-outline.nvim',
    config = require('modules.lsp.symbols-outline').setup,
  }

  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 15; -- Height of the floating window
        border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
      }
    end
  }

  use {
    'glepnir/lspsaga.nvim',
    cmd = 'Lspsaga',
  }

  use {
    'nvim-lua/lsp-status.nvim',
    config = require('modules.lsp.lsp-status').setup,
  }
  --
  -- EDITOR
  --

  -- use 'scrooloose/nerdcommenter'
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use 'junegunn/vim-easy-align'
  use 'mg979/vim-visual-multi'
  use 'tpope/vim-surround'
  use {
    'rhysd/accelerated-jk',
    config = require('modules.editor.acceleratedjk').setup,
  }
  use {
    'hrsh7th/vim-eft',
    config = require('modules.editor.vim-eft').setup,
  }
  use {
    'kana/vim-niceblock',
    config = require('modules.editor.vim-niceblock').setup,
  }

  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use {
    'itchyny/vim-cursorword',
    event = {'BufReadPre','BufNewFile'},
    config = require('modules.editor.cursorword').setup,
  }

  use {
    'Raimondi/delimitMate',
    event = 'InsertEnter',
    config = require('modules.editor.delimimate').setup,
  }

  use {
    'glepnir/smartinput.nvim',
    ft = 'go',
    config = require('modules.editor.smartinput').setup,
  }

  use {
    'L3MON4D3/LuaSnip',
    config = require('modules.editor.luasnip').setup,
  }

  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { "hrsh7th/cmp-nvim-lsp",   after = "nvim-cmp" },
      --{ "f3fora/cmp-spell",     after = "nvim-cmp" },
      { "hrsh7th/cmp-path",       after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer",     after = "nvim-cmp" },
      { "onsails/lspkind-nvim" },
      { 'L3MON4D3/LuaSnip' },
      {'tzachar/cmp-tabnine',     after = 'nvim-cmp'},
      --{ "hrsh7th/cmp-calc", after = "nvim-cmp" },
      --{ "quangnguyen30192/cmp-nvim-ultisnips", after = "nvim-cmp" },
    },
    config = require('modules.editor.cmp').setup,
  }

  use { 'saadparwaiz1/cmp_luasnip' }
  
  -- Debugger
  use {
    'mfussenegger/nvim-dap',
    config = require('modules.dap').setup,
  }
  use {
    'leoluz/nvim-dap-go',
    requires = {{'mfussenegger/nvim-dap'}},
    config = function ()
      require('dap-go').setup()
    end
  }
  use {'theHamsta/nvim-dap-virtual-text'}
  use {
    'rcarriga/nvim-dap-ui',
    requires = {{'mfussenegger/nvim-dap'}},
    config = require('modules.dap.ui').setup,
  }
  use {
    "Pocco81/DAPInstall.nvim",
    requires = {{'mfussenegger/nvim-dap'}},
    config = function ()
      local dap_install = require("dap-install")

      dap_install.setup({
        installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
      })
    end
  }

  --
  -- Tools
  --

  use 'voldikss/vim-floaterm'
  use {
    'numtostr/FTerm.nvim',
    config = require('modules.tools.fterm').setup,
  }

  use 'tpope/vim-git'
  use 'motemen/git-vim'
  use 'tpope/vim-fugitive'
  use {'pwntester/octo.nvim', config=function()
    require"octo".setup()
  end}

  use 'vim-test/vim-test'

  use {
    'glepnir/prodoc.nvim',
    event = 'BufReadPre',
  }

  use {
    'brooth/far.vim',
    cmd = {'Far','Farp'},
    config = function ()
      vim.g['far#source'] = 'rg'
    end
  }

  use {
    'sindrets/diffview.nvim',
    config = require('modules.tools.diffview').setup
  }


  local function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
  end
  if not file_exists(vim.fn.stdpath('config').."/plugin/packer_compiled.lua") then
    require('packer').sync()
  end

end)

require('modules.mapping')

