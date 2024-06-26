-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    after = 'telescope.nvim',
    config = require('modules.treesitter').setup,
    run = ':TSUpdate',
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },

  {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
  },

  'famiu/bufdelete.nvim',

  -- Colorschemes
  --  'mhartington/oceanic-next'

  --  "rebelot/kanagawa.nvim"
  --  {
  --   'ribru17/bamboo.vim',
  -- }

  -- {
  --   'sainnhe/sonokai',
  --   -- config = require('modules.ui.sonokai').setup,
  -- },

  -- 'navarasu/onedark.nvim',
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.cmd([[colorscheme gruvbox]])
    end
  },

  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      -- vim.cmd('colorscheme gruvbox-material')
    end
  },

  -- {
  --   'eddyekofo94/gruvbox-flat.nvim',
  --   config = require('modules.ui.gruvbox-flat').setup,
  -- },
  --
  -- {
  --   'luisiacc/gruvbox-baby',
  --   config = require('modules.ui.gruvbox-baby').setup,
  -- },
  -- 'rmehri01/onenord.nvim',
  --'glepnir/zephyr-nvim',
  --'gruvbox-community/gruvbox',
  --'folke/tokyonight.nvim',
  --'EdenEast/nightfox.nvim',
  --'Murtaza-Udaipurwala/gruvqueen',
  --  {
  --   'olimorris/onedarkpro.nvim',
  --   config = require('modules.ui.onedarkpro').setup,
  -- },

  'kyazdani42/nvim-web-devicons',

  -- Buffer line
  --  {
  --   'akinsho/nvim-bufferline.lua',
  --   dependencies = {'kyazdani42/nvim-web-devicons'},
  --   config = require('modules.ui.bufferline').setup,
  -- },

  'vrischmann/tree-sitter-templ',

  -- {
  --   'romgrk/nvim-treesitter-context',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   after = 'nvim-treesitter',
  --   config = function()
  --     require('modules.ui.context').setup()
  --   end,
  -- },

  -- {
  --   "SmiteshP/nvim-navic",
  --   -- after = 'nvim-lspconfig',
  --   dependencies = "neovim/nvim-lspconfig",
  --   config = require('modules.ui.navic').setup,
  -- },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
    },
    config = require('modules.ui.lualine').setup,
  },

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end
  },

  {
    'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup()
    end,
  },

  -- Tree file manager
  --  {
  --   'kyazdani42/nvim-tree.lua',
  --   dependencies = {'kyazdani42/nvim-web-devicons'},
  --   config = require('modules.ui.nvim-tree').setup,
  --   cmd = {'NvimTreeToggle','NvimTreeOpen'},
  -- },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("modules.ui.neo-tree").setup()
    end
  },

  --  {
  --   'ThePrimeagen/harpoon',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  -- },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('modules.ui.harpoon').setup()
    end,
  },

  {
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
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      -- you'll need at least one of these
      { 'nvim-telescope/telescope.nvim' },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
      --      require('telescope').load_extension('neoclip')
    end,
  },

  -- Guide lines for ident
  --  {
  --   'glepnir/indent-guides.nvim',
  --   event = 'BufRead',
  -- },

  -- Git signals right side
  -- {
  --   'lewis6991/gitsigns.nvim',
  --   dependencies = { 'nvim-lua/plenary.nvim', opt = true },
  --   config = require('modules.ui.gitsigns').setup,
  -- },

  -- Keystrokes/mappings helper
  --  {
  --   'folke/which-key.nvim',
  --   config = require('modules.ui.which-key').setup,
  -- },

  --  'junegunn/vim-peekaboo'
  --  'Yilin-Yang/vim-markbar'

  {
    'rcarriga/nvim-notify',
    -- config = function()
    --   require("notify").setup({
    --     background_colour = "#000000"
    --   })
    --   vim.notify = require("notify")
    -- end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      "hrsh7th/nvim-cmp"
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
          hover = { enabled = true },
          signature = { enabled = true },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
      })
    end,
  },

  -- {
  --   'stevearc/dressing.nvim',
  --   config = function()
  --     require('dressing').setup()
  --   end
  -- },

  -- Zen mode
  {
    'folke/twilight.nvim',
    config = function()
      require("twilight").setup {
        dimming = {
          inactive = true,
        },
        context = 15,
      }
    end
  },

  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = function()
      require("no-neck-pain").setup({
        width = 150,
        buffers = {
          scratchPad = {
            -- set to `false` to
            -- disable auto-saving
            enabled = true,
            -- set to `nil` to default
            -- to current working directory
            location = "~/code/notes/",
          },
          bo = {
            filetype = "md"
          },
        },

      })
    end
  },

  {
    'folke/zen-mode.nvim',
    config = require('modules.ui.zen-mode').setup,
  },

  --  { 'smithbm2316/centerpad.nvim' },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
      -- { 'nvim-telescope/telescope-frecency.nvim' },
      { 'tami5/sqlite.lua' },
      { 'zane-/cder.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-dap.nvim' },
      { 'LukasPietzschmann/telescope-tabs' },
      { 'ThePrimeagen/harpoon' },
      { 'nvim-telescope/telescope-ui-select.nvim' }
    },
    config = require('modules.ui.telescope').setup,
  },

  -- ---------------------------------------------
  -- LSP
  -- ---------------------------------------------

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = require('modules.lsp.mason-lspconfig').setup,
  },

  -- { "hrsh7th/cmp-nvim-lsp" },

  {
    'onsails/lspkind-nvim',
    config = require('modules.lsp.lspkind').setup,
  },

  {
    'folke/trouble.nvim',
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ls",
        "<cmd>Trouble symbols toggle focus=true win.position=bottom<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>ll",
        "<cmd>Trouble lsp toggle focus=true win.position=bottom<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = {
      win = {
        size = { height = 25 },
      },
    }, -- for default options, refer to the configuration section for custom setup.
  },
  -- {
  --   'folke/lsp-trouble.nvim',
  --   config = require('modules.lsp.lsp-trouble').setup,
  -- },


  {
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
  },

  {
    'nvim-lua/lsp-status.nvim',
    config = require('modules.lsp.lsp-status').setup,
  },

  {
    "dnlhc/glance.nvim",
    config = function()
      local glance = require('glance')
      local actions = glance.actions

      require('glance').setup({
        detached = true,
        theme = {          -- This feature might not work properly in nvim-0.7.2
          enable = true,   -- Will generate colors for the plugin based on your current colorscheme
          mode = 'darken', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
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
  },
  --  'jose-elias-alvarez/nvim-lsp-ts-utils',

  --
  -- EDITOR
  --

  --  'scrooloose/nerdcommenter'

  {
    'Bekaboo/dropbar.nvim',
    version = '*',
    -- config = require('modules.ui.dropbar').setup
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  },

  -- {
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('Comment').setup()
  --   end
  -- },

  {
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
  },

  -- { "ziontee113/color-picker.nvim",
  --   config = function()
  --     require("color-picker")
  --   end,
  -- },

  --  {
  --   'woosaaahh/sj.nvim',
  --   config = function()
  --     local sj = require("sj")
  --     sj.setup({
  --       auto_jump = true,
  --     })
  --     vim.keymap.set("n", "s", sj.run)
  --   end
  -- },

  {
    'ggandor/leap.nvim',
    config = function()
      -- require('leap').leap { target_windows = { vim.fn.win_getid() } }
      -- require('leap').add_default_mappings()
    end
  },

  --  'junegunn/vim-easy-align',

  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.bufremove').setup()
      require('mini.align').setup()
      require('mini.files').setup()
      require('mini.visits').setup({
        store = {
          autowrite = false,
        }
      })
      require('mini.diff').setup()
    end
  },

  {
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

          -- `[` and `]`
          { mode = 'n', keys = '[' },
          { mode = 'n', keys = ']' },
          { mode = 'x', keys = '[' },
          { mode = 'x', keys = ']' },
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
  },

  'mg979/vim-visual-multi',

  -- 'tpope/vim-surround',

  {
    'rhysd/accelerated-jk',
    config = require('modules.editor.acceleratedjk').setup,
  },

  {
    'hrsh7th/vim-eft',
    config = require('modules.editor.vim-eft').setup,
  },

  {
    'kana/vim-niceblock',
    config = require('modules.editor.vim-niceblock').setup,
  },

  {
    'phaazon/hop.nvim',
    name = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'asdfghjkl' }
    end
  },

  {
    "brenton-leighton/multiple-cursors.nvim",
    config = true,
    keys = {
      { "<C-M-Down>",    "<Cmd>MultipleCursorsAddDown<CR>",        mode = { "n", "i" } },
      { "<C-M-j>",       "<Cmd>MultipleCursorsAddDown<CR>" },
      { "<C-M-Up>",      "<Cmd>MultipleCursorsAddUp<CR>",          mode = { "n", "i" } },
      { "<C-M-k>",       "<Cmd>MultipleCursorsAddUp<CR>" },
      { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" } },
    },
  },

  {
    'drybalka/tree-climber.nvim'
  },

  {
    'itchyny/vim-cursorword',
    event = { 'BufReadPre', 'BufNewFile' },
    config = require('modules.editor.cursorword').setup,
  },

  {
    'Raimondi/delimitMate',
    event = 'InsertEnter',
    config = require('modules.editor.delimimate').setup,
  },

  --  {
  --   'glepnir/nvim',
  --   ft = 'go',
  --   config = require('modules.editor.smartinput').setup,
  -- },

  {
    'L3MON4D3/LuaSnip',
    config = require('modules.editor.luasnip').setup,
  },

  -- { 'tzachar/cmp-tabnine',     run = './install.sh', dependencies = 'hrsh7th/nvim-cmp' },

  -- vim.g.copilot_no_tab_map = true;
  --  {
  --   'github/copilot.vim',
  --   config = function()
  --   end
  -- },

  {
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
        -- copilot_node_command = 'node', -- Node version must be < 18
        copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v16.20.2/bin/node", -- Node.js version must be > 16.x
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
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "zbirenbaum/copilot-cmp",
    -- after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup({
        -- method = "getCompletionsCycling",
        method = "getPanelCompletions",
      })
    end
  },

  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp",        after = "nvim-cmp" },
      --{ "f3fora/cmp-spell",     after = "nvim-cmp" },
      { "hrsh7th/cmp-path",            after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer",          after = "nvim-cmp" },
      { "onsails/lspkind-nvim" },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
      -- { 'hrsh7th/cmp-copilot', after = "nvim-cmp" },
      -- { 'tzachar/cmp-tabnine',    after = 'nvim-cmp' },
      { "zbirenbaum/copilot-cmp",      after = "nvim-cmp" },
    },
    config = require('modules.editor.cmp').setup,
  },


  {
    'andymass/vim-matchup',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  --  {
  --   'mfussenegger/nvim-treehopper',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  -- },

  --  {
  --   'ziontee113/syntax-tree-surfer',
  --   after = { "nvim-treesitter/nvim-treesitter" },
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   config = function()
  --     require('syntax-tree-surfer').setup()
  --   end
  -- },


  {
    'booperlv/nvim-gomove',
    config = function()
      require("gomove").setup {}
    end
  },

  -- { 'anuvyklack/pretty-fold.nvim',
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
  -- },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = require('modules.editor.nvim-ufo').setup,
  },

  -- Debugger
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      { 'rcarriga/nvim-dap-ui' },
      { 'theHamsta/nvim-dap-virtual-text' },
    },
    config = require('modules.dap').setup,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'nvim-neotest/nvim-nio',
    },
  },

  {
    'leoluz/nvim-dap-go',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require('dap-go').setup()
    end
  },

  {
    "Pocco81/DAPInstall.nvim",
    dependencies = { { 'mfussenegger/nvim-dap' } },
    config = function()
      -- local dap_install = require("dap-install")
      --
      -- dap_install.setup({
      --   installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
      -- })
    end
  },

  --
  -- Tools
  --

  {
    dir = '~/code/hobord/gotest.nvim',
    -- 'hobord/gotest.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/popup.nvim',
    },
    config = function()
      require('gotest').setup()
    end
  },

  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup({
        direction = "bottom",
      })
    end
  },

  --  {
  --   "Dax89/automaton.nvim",
  --   version = '1.3.0',
  --   dependencies = {
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
  -- },
  --
  --  'voldikss/vim-floaterm',
  --
  --  {
  --   'numtostr/FTerm.nvim',
  --   config = require('modules.tools.fterm').setup,
  -- },

  {
    'akinsho/toggleterm.nvim',
    version = 'v2.x',
    config = function()
      require("toggleterm").setup()
    end
  },

  --  'tpope/vim-git',
  --  'motemen/git-vim',
  --  'tpope/vim-fugitive',

  {
    'ldelossa/gh.nvim',
    dependencies = { { 'ldelossa/litee.nvim' } },
    config = function()
      require('litee.lib').setup()
      require('litee.gh').setup()
    end
  },
  --
  --  {
  --   'tanvirtin/vgit.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim'
  --   },
  --   config = function()
  --     require('vgit').setup()
  --   end
  -- },

  {
    'sindrets/diffview.nvim',
    config = require('modules.tools.diffview').setup
  },

  {
    -- 'TimUntersberger/neogit',
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = require('modules.tools.neogit').setup,
  },

  {
    'jakewvincent/mkdnflow.nvim',
    -- rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    config = function()
      require('mkdnflow').setup({
        to_do = {
          symbols = { ' ', '-', 'X' },
          update_parents = true,
          not_started = ' ',
          in_progress = '-',
          complete = 'X'
        },
      })
    end
  },


  -- {
  --   'pwntester/octo.nvim',
  --   config = function()
  --     require "octo".setup()
  --   end
  -- },

  'vim-test/vim-test',

  --  {
  --   'glepnir/prodoc.nvim',
  --   event = 'BufReadPre',
  -- },

  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {}
  },
  {
    'uga-rosa/translate.nvim',
    config = function()
      require('translate').setup({
        -- your configuration comes here
        -- or leave it empty to  the default settings
        -- refer to the configuration section below
      })
    end
  },

  {
    "gbprod/yanky.nvim",
    dependencies = { "tami5/sqlite.lua" },
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
            action = nil, -- nil to  default put action
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
  },

  {
    'brooth/far.vim',
    cmd = { 'Far', 'Farp' },
    config = function()
      vim.g['far#source'] = 'rg'
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to  the default settings
        -- refer to the configuration section below
      }
    end
  },

  {
    'David-Kunz/gen.nvim',
    config = function()
      require('gen').setup({
        model = "codellama",
        display_mode = "split",
        show_model = true,
      })
      require('gen').prompts['Execute selected text'] = {
        prompt = "$text",
        replace = false
      }
      require('gen').prompts['Elaborate_Text'] = {
        prompt = "Elaborate the following text:\n$text",
        replace = false
      }
    end
  },

  {
    'rmagatti/auto-session',
    version = "v2.x",
    config = function()
      require("auto-session").setup()
    end
  },

})
