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

  use 'famiu/bufdelete.nvim'

  -- Colorschemes
  -- use 'mhartington/oceanic-next'

  -- use "rebelot/kanagawa.nvim"
  -- use {
  --   'ribru17/bamboo.vim',
  -- }

  use {
    'sainnhe/sonokai',
    -- config = require('modules.ui.sonokai').setup,
  }

  use 'navarasu/onedark.nvim'

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
  -- use {
  --   'olimorris/onedarkpro.nvim',
  --   config = require('modules.ui.onedarkpro').setup,
  -- }

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

  -- use {
  --   'ThePrimeagen/harpoon',
  --   requires = { 'nvim-lua/plenary.nvim' },
  -- }

  use {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup({
        -- default_mappings = true,
        mappings = {
          toggle = 'mm',
          next = 'mk',
          prev = 'mj',
        },
      })
    end,
  }

  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      -- you'll need at least one of these
      { 'nvim-telescope/telescope.nvim' },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
      --      require('telescope').load_extension('neoclip')
    end,
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
  -- use {
  --   'folke/which-key.nvim',
  --   config = require('modules.ui.which-key').setup,
  -- }

  -- use 'junegunn/vim-peekaboo'
  -- use 'Yilin-Yang/vim-markbar'

  use {
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup({
        background_colour = "#000000"
      })
      vim.notify = require("notify")
    end
  }

  use {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup()
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

  -- use { 'smithbm2316/centerpad.nvim' }


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
  --

  -- use {
  --   'stevearc/aerial.nvim',
  --   config = function()
  --     require('aerial').setup()
  --     require('telescope').load_extension('aerial')
  --   end
  -- }

  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        width = 120, -- Width of the floating window
        height = 15, -- Height of the floating window
        border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
      }
    end
  }

  use {
    'nvim-lua/lsp-status.nvim',
    config = require('modules.lsp.lsp-status').setup,
  }

  use({
    "dnlhc/glance.nvim",
    config = function()
      local glance = require('glance')
      local actions = glance.actions

      require('glance').setup({
        border = {
          enable = true, -- Show window borders. Only horizontal borders allowed
          top_char = '─',
          bottom_char = '─',
        },
        theme = {         -- This feature might not work properly in nvim-0.7.2
          enable = false, -- Will generate colors for the plugin based on your current colorscheme
          mode = 'auto',  -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
        },
        mappings = {
          list = {
            ['j'] = actions.next,     -- Bring the cursor to the next item in the list
            ['k'] = actions.previous, -- Bring the cursor to the previous item in the list
            ['<Down>'] = actions.next,
            ['<Up>'] = actions.previous,
            ['<C-j>'] = actions.next_location,     -- Bring the cursor to the next location skipping groups in the list
            ['<C-k>'] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
            ['<C-u>'] = actions.preview_scroll_win(5),
            ['<C-d>'] = actions.preview_scroll_win(-5),
            ['v'] = actions.jump_vsplit,
            ['s'] = actions.jump_split,
            ['t'] = actions.jump_tab,
            ['<CR>'] = actions.jump,
            ['o'] = actions.jump,
            ['l'] = actions.open_fold,
            ['h'] = actions.close_fold,
            ['<C-h>'] = actions.enter_win('preview'), -- Focus preview window
            ['q'] = actions.close,
            ['Q'] = actions.close,
            ['<Esc>'] = actions.close,
            ['<C-q>'] = actions.quickfix,
            -- ['<Esc>'] = false -- disable a mapping
          },
          preview = {
            ['Q'] = actions.close,
            ['<C-j>'] = actions.next_location,
            ['<C-k'] = actions.previous_location,
            ['<C-l>'] = actions.enter_win('list'), -- Focus list window
          },
        },
      })
    end,
  }) -- use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  --
  -- EDITOR
  --

  -- use 'scrooloose/nerdcommenter'

  use {
    'Bekaboo/dropbar.nvim',
    version = '*'
    -- config = require('modules.ui.dropbar').setup
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        '*',
      }, {
        RGB      = true, -- #RGB hex codes
        RRGGBB   = true, -- #RRGGBB hex codes
        names    = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn   = true, -- CSS rgb() and rgba() functions
        hsl_fn   = true, -- CSS hsl() and hsla() functions
        css      = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end
  }

  -- use({ "ziontee113/color-picker.nvim",
  --   config = function()
  --     require("color-picker")
  --   end,
  -- })

  -- use {
  --   'woosaaahh/sj.nvim',
  --   config = function()
  --     local sj = require("sj")
  --     sj.setup({
  --       auto_jump = true,
  --     })
  --     vim.keymap.set("n", "s", sj.run)
  --   end
  -- }

  use {
    'ggandor/leap.nvim',
    config = function()
      -- require('leap').leap { target_windows = { vim.fn.win_getid() } }
      -- require('leap').add_default_mappings()
    end
  }
  -- use 'junegunn/vim-easy-align'
  use {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.align').setup()
    end
  }
  use {
    'echasnovski/mini.clue',
    config = function()
      local miniclue = require('mini.clue')
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },


          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          { mode = 'n', keys = '<Leader>f', desc = 'Find' },
          { mode = 'n', keys = '<Leader>g', desc = 'Glance' },
          { mode = 'n', keys = '<Leader>G', desc = 'Git' },
          { mode = 'n', keys = '<Leader>l', desc = 'LSP' },
          { mode = 'n', keys = '<Leader>r', desc = 'Run' },
          { mode = 'n', keys = '<Leader>t', desc = 'Tabs' },
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },

        window = {
          delay = 300,
          config = {
            width = 'auto',
          },
        }
      })
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
    'drybalka/tree-climber.nvim'
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

  -- use {
  --   'glepnir/nvim',
  --   ft = 'go',
  --   config = require('modules.editor.smartinput').setup,
  -- }

  use {
    'L3MON4D3/LuaSnip',
    config = require('modules.editor.luasnip').setup,
  }

  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

  -- vim.g.copilot_no_tab_map = true;
  -- use {
  --   'github/copilot.vim',
  --   config = function()
  --   end
  -- }

  use {
    "zbirenbaum/copilot.lua",
    -- event = "InsertEnter",
    event = "VimEnter",
    config = function()
      -- vim.schedule(function()
      -- event = "VimEnter",
      -- config = function()
      --   vim.defer_fn(function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
          -- ["*"] = true,
        },
        copilot_node_command = 'node', -- Node version must be < 18
        plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
        server_opts_overrides = {
          settings = {
            advanced = {
              listCount = 10,         -- #completions for panel
              inlineSuggestCount = 4, -- #completions for getCompletions
            }
          },
        },
      })
      -- end)
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    -- after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup({
        -- method = "getCompletionsCycling",
        method = "getPanelCompletions",
      })
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { "hrsh7th/cmp-nvim-lsp",   after = "nvim-cmp" },
      --{ "f3fora/cmp-spell",     after = "nvim-cmp" },
      { "hrsh7th/cmp-path",       after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer",     after = "nvim-cmp" },
      { "onsails/lspkind-nvim" },
      { 'L3MON4D3/LuaSnip' },
      -- { 'hrsh7th/cmp-copilot', after = "nvim-cmp" },
      { 'tzachar/cmp-tabnine',    after = 'nvim-cmp' },
      { "zbirenbaum/copilot-cmp", after = "nvim-cmp" },
    },
    config = require('modules.editor.cmp').setup,
  }

  use { 'saadparwaiz1/cmp_luasnip' }

  use {
    'andymass/vim-matchup',
    requires = { 'nvim-treesitter/nvim-treesitter' },
  }

  -- use {
  --   'mfussenegger/nvim-treehopper',
  --   requires = { 'nvim-treesitter/nvim-treesitter' },
  -- }

  -- use {
  --   'ziontee113/syntax-tree-surfer',
  --   after = { "nvim-treesitter/nvim-treesitter" },
  --   requires = { 'nvim-treesitter/nvim-treesitter' },
  --   config = function()
  --     require('syntax-tree-surfer').setup()
  --   end
  -- }


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
    'leoluz/nvim-dap-go',
    requires = { 'mfussenegger/nvim-dap' },
    config = function()
      require('dap-go').setup()
    end
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

  use {
    '~/code/hobord/nvim/gotest.nvim',
    -- 'hobord/gotest.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/popup.nvim',
    },
    config = function()
      -- require('gotest').setup()
    end
  }

  use {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup({
        direction = "bottom",
      })
    end
  }

  -- use {
  --   "Dax89/automaton.nvim",
  --   version = '1.3.0',
  --   requires = {
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-telescope/telescope.nvim" },
  --     { "mfussenegger/nvim-dap" }, -- Debug support for 'launch' configurations (Optional)
  --     { "hrsh7th/nvim-cmp" }, -- Autocompletion for automaton workspace files (Optional)
  --     { "L3MON4D3/LuaSnip" }, -- Snippet support for automaton workspace files (Optional)
  --   },
  --   config = function()
  --     require("automaton").setup({
  --       debug = true,
  --       saveall = true,
  --       ignore_ft = {},
  --
  --       integrations = {
  --         luasnip = true,
  --         cmp = true,
  --       },
  --
  --       icons = {
  --         buffer = "",
  --         close = "",
  --         launch = "",
  --         task = "",
  --         wor b bkspace = "",
  --       },
  --
  --       events = {
  --         workspacechanged = function(ws)
  --           -- "ws" is the current workspace object (can be nil)
  --         end
  --       }
  --     })
  --   end
  -- }
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
  -- use {
  --   'tanvirtin/vgit.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   },
  --   config = function()
  --     require('vgit').setup()
  --   end
  -- }
  use {
    'sindrets/diffview.nvim',
    config = require('modules.tools.diffview').setup
  }

  use {
    -- 'TimUntersberger/neogit',
    'NeogitOrg/neogit',
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

  -- use {
  --   'glepnir/prodoc.nvim',
  --   event = 'BufReadPre',
  -- }

  use {
    'uga-rosa/translate.nvim',
    config = function()
      require('translate').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end
  }

  use({
    "gbprod/yanky.nvim",
    requires = { "kkharji/sqlite.lua" },
    config = function()
      local utils = require("yanky.utils")
      local mapping = require("yanky.telescope.mapping")
      require("telescope").load_extension("yank_history")
      require("yanky").setup({
        preserve_cursor_position = {
          enabled = true,
        },
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 500,
        },
        picker = {
          select = {
            action = nil, -- nil to use default put action
          },
          telescope = {
            mappings = {
              default = mapping.put("p"),
              i = {
                ["<c-p>"] = mapping.put("p"),
                ["<c-k>"] = mapping.put("P"),
                ["<c-x>"] = mapping.delete(),
                ["<c-r>"] = mapping.set_register(utils.get_default_register()),
              },
              n = {
                p = mapping.put("p"),
                P = mapping.put("P"),
                d = mapping.delete(),
                r = mapping.set_register(utils.get_default_register())
              },
            },
          },
        },
      })

      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
    end
  })

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
    tag = "v2.*",
    config = function()
      require("auto-session").setup()
    end
  }

  local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
      io.close(f)
      return true
    else
      return false
    end
  end

  if not file_exists(vim.fn.stdpath('config') .. "/plugin/packer_compiled.lua") then
    require('packer').sync()
  end
end)
