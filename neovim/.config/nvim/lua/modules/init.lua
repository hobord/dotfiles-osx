-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()
require 'packer'.init({
  max_jobs = 50
})

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    after = 'telescope.nvim',
    config = require('modules.treesitter').setup,
    run = ':TSUpdate',
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
  }


  -- Colorschemes
  use {
    'eddyekofo94/gruvbox-flat.nvim',
    config = require('modules.ui.gruvbox-flat').setup,
  }

  use {
    'luisiacc/gruvbox-baby',
    config = require('modules.ui.gruvbox-baby').setup,
  }
  --use 'rmehri01/onenord.nvim'
  --'glepnir/zephyr-nvim'
  --'gruvbox-community/gruvbox'
  --'folke/tokyonight.nvim'
  --'EdenEast/nightfox.nvim'
  --'Murtaza-Udaipurwala/gruvqueen'
  use {
    'olimorris/onedarkpro.nvim',
    config = require('modules.ui.onedarkpro').setup,
  }

  use 'kyazdani42/nvim-web-devicons'

  -- Buffer line
  -- use {
  --   'akinsho/nvim-bufferline.lua',
  --   requires = {'kyazdani42/nvim-web-devicons'},
  --   config = require('modules.ui.bufferline').setup,
  -- }

  use {
    'romgrk/nvim-treesitter-context',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    after = 'nvim-treesitter',
    config = function()
      require('modules.ui.context').setup()
    end,
  }

  use {
    "SmiteshP/nvim-navic",
    -- after = 'nvim-lspconfig',
    requires = "neovim/nvim-lspconfig",
    config = require('modules.ui.navic').setup,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
    },
    config = require('modules.ui.lualine').setup,
  }

  use {
    'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup()
    end,
  }

  -- Tree file manager
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = {'kyazdani42/nvim-web-devicons'},
  --   config = require('modules.ui.nvim-tree').setup,
  --   cmd = {'NvimTreeToggle','NvimTreeOpen'},
  -- }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("modules.ui.neo-tree").setup()
    end
  }

  use {
    'ThePrimeagen/harpoon',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Guide lines for ident
  -- use {
  --   'glepnir/indent-guides.nvim',
  --   event = 'BufRead',
  -- }

  -- Git signals right side
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim', opt = true },
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
      require("notify").setup({
        background_colour = "#000000"
      })
    end
  }

  -- Zen mode
  use {
    'folke/twilight.nvim',
    config = function()
      require("twilight").setup {
        dimming = {
          inactive = true,
        },
        context = 15,
      }
    end
  }
  use {
    'folke/zen-mode.nvim',
    config = require('modules.ui.zen-mode').setup,
  }

  use { 'smithbm2316/centerpad.nvim' }


  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'tami5/sqlite.lua' },
      { 'zane-/cder.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-dap.nvim' },
      { 'LukasPietzschmann/telescope-tabs' }
    },
    config = require('modules.ui.telescope').setup,
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
    requires = { { 'neovim/nvim-lspconfig' } }
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

  -- use {
  --   'simrat39/symbols-outline.nvim',
  --   config = require('modules.lsp.symbols-outline').setup,
  -- }

  use {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup()
      require('telescope').load_extension('aerial')
    end
  }

  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 15; -- Height of the floating window
        border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }; -- Border characters of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
      }
    end
  }

  use {
    'nvim-lua/lsp-status.nvim',
    config = require('modules.lsp.lsp-status').setup,
  }

  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
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
  use {
    'woosaaahh/sj.nvim',
    config = function()
      local sj = require("sj")
      sj.setup({
        auto_jump = true,
      })
      vim.keymap.set("n", "s", sj.run)
    end
  }
  -- use 'junegunn/vim-easy-align'
  use {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.align').setup()
    end
  }
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
      require 'hop'.setup { keys = 'asdfghjkl' }
    end
  }

  use {
    'itchyny/vim-cursorword',
    event = { 'BufReadPre', 'BufNewFile' },
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

  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

  vim.g.copilot_no_tab_map = true;
  use {
    'github/copilot.vim',
    config = function()
    end
  }

  -- use {
  --   "zbirenbaum/copilot.lua",
  --   event = "InsertEnter",
  --   config = function ()
  --     vim.schedule(function()
  --   -- event = "VimEnter",
  --   -- config = function()
  --   --   vim.defer_fn(function()
  --       require("copilot").setup({
  --         panel = {
  --           enabled = true,
  --           auto_refresh = true,
  --           keymap = {
  --             jump_prev = "[[",
  --             jump_next = "]]",
  --             accept = "<CR>",
  --             refresh = "gr",
  --             open = "<M-CR>"
  --           },
  --         },
  --         suggestion = {
  --           enabled = true,
  --           auto_trigger = true,
  --           debounce = 75,
  --           keymap = {
  --           accept = "<C-CR>",
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-]>",
  --           },
  --         },
  --         filetypes = {
  --           yaml = false,
  --           markdown = false,
  --           help = false,
  --           gitcommit = false,
  --           gitrebase = false,
  --           hgcommit = false,
  --           svn = false,
  --           cvs = false,
  --           ["."] = false,
  --           -- ["*"] = true,
  --         },
  --         copilot_node_command = 'node', -- Node version must be < 18
  --         plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
  --         server_opts_overrides = {},
  --       })
  --     end)
  --   end,
  -- }

  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function ()
  --     require("copilot_cmp").setup()
  --   end
  -- }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      --{ "f3fora/cmp-spell",     after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "onsails/lspkind-nvim" },
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/cmp-copilot', after = "nvim-cmp" },
      { 'tzachar/cmp-tabnine', after = 'nvim-cmp' },
      { "zbirenbaum/copilot-cmp", after = "nvim-cmp" },
    },
    config = require('modules.editor.cmp').setup,
  }

  use { 'saadparwaiz1/cmp_luasnip' }

  use {
    'andymass/vim-matchup',
    requires = { 'nvim-treesitter/nvim-treesitter' },
  }

  use {
    'mfussenegger/nvim-treehopper',
    requires = { 'nvim-treesitter/nvim-treesitter' },
  }


  use {
    'booperlv/nvim-gomove',
    config = function()
      require("gomove").setup {}
    end
  }

  -- use{ 'anuvyklack/pretty-fold.nvim',
  --   config = function()
  --     require('pretty-fold').setup{
  --       keep_indentation = false,
  --       fill_char = '━',
  --       sections = {
  --           left = {
  --             '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
  --           },
  --           right = {
  --             '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
  --           }
  --       }
  --     }
  --     -- require('pretty-fold.preview').setup_keybinding()
  --   end
  -- }
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = require('modules.editor.nvim-ufo').setup,
  }

  -- Debugger
  use {
    'mfussenegger/nvim-dap',
    requires = {
      { 'rcarriga/nvim-dap-ui' },
      { 'theHamsta/nvim-dap-virtual-text' },
    },
    config = require('modules.dap').setup,
  }

  use {
    "Pocco81/DAPInstall.nvim",
    requires = { { 'mfussenegger/nvim-dap' } },
    config = function()
      -- local dap_install = require("dap-install")
      --
      -- dap_install.setup({
      --   installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
      -- })
    end
  }

  --
  -- Tools
  --

  -- use 'voldikss/vim-floaterm'
  -- use {
  --   'numtostr/FTerm.nvim',
  --   config = require('modules.tools.fterm').setup,
  -- }
  use {
    'akinsho/toggleterm.nvim',
    tag = 'v2.*',
    config = function()
      require("toggleterm").setup()
    end
  }

  -- use 'tpope/vim-git'
  -- use 'motemen/git-vim'
  -- use 'tpope/vim-fugitive'

  -- use {
  --   'ldelossa/gh.nvim',
  --   requires = { { 'ldelossa/litee.nvim' } },
  --   config = function()
  --     require('litee.lib').setup()
  --     require('litee.gh').setup()
  --   end
  -- }

  use {
    'sindrets/diffview.nvim',
    config = require('modules.tools.diffview').setup
  }

  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = require('modules.tools.neogit').setup,
  }

  use { 'pwntester/octo.nvim', config = function()
    require "octo".setup()
  end }

  use 'vim-test/vim-test'

  use {
    'glepnir/prodoc.nvim',
    event = 'BufReadPre',
  }

  use {
    'brooth/far.vim',
    cmd = { 'Far', 'Farp' },
    config = function()
      vim.g['far#source'] = 'rg'
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup()
    end
  }

  local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then io.close(f) return true else return false end
  end

  if not file_exists(vim.fn.stdpath('config') .. "/plugin/packer_compiled.lua") then
    require('packer').sync()
  end

end)

require('modules.mapping')
