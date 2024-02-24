local config = {}

config.setup = function()
  -- if not packer_plugins['plenary.nvim'].loaded then
  --   vim.cmd [[packadd plenary.nvim]]
  --   vim.cmd [[packadd popup.nvim]]
  --   vim.cmd [[packadd telescope-fzy-native.nvim]]
  -- end
  --local utils = require "telescope.utils"

  require('telescope').setup {
    defaults = {
      prompt_prefix = '🔭 ',
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
        width = 0.9,
        height = 0.9,
        horizontal = {
          mirror = false,
        }
      },
      selection_caret = " ",
      sorting_strategy = 'ascending',
      file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
      mappings = {
        n = {
          ["<c-j>"] = require "telescope.actions".preview_scrolling_down,
          ["<c-k>"] = require "telescope.actions".preview_scrolling_up,
        },
      },
    },
    pickers = {
      buffers = {
        sort_lastused = true,
        --theme = "dropdown",
        --previewer = "file_previewer",
        layout_strategy = "vertical",
        mappings = {
          i = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
            -- Right hand side can also be the name of the action as a string
            ["<c-d>"] = "delete_buffer",
          },
          n = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          }
        },
        layout_config = {
          prompt_position = "top",
          vertical = {
            mirror = true,
          }
        }
      },
      file_browser = {
        layout_config = {
          preview_width = 0.6
        },
      },
      lsp_document_symbols = {
        fname_width = 100,
        symbol_width = 95,
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          preview_height = 0.6,
          vertical = {
            mirror = true,
          }
        },
      },
      lsp_references = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          preview_height = 0.7,
          vertical = {
            mirror = true,
          }
        },
      },
      lsp_outgoing_calls = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          preview_height = 0.7,
          vertical = {
            mirror = true,
          }
        },
      },
      lsp_incoming_calls = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          preview_height = 0.7,
          vertical = {
            mirror = true,
          }
        },
      },
      lsp_implementations = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          preview_height = 0.7,
          vertical = {
            mirror = true,
          }
        },
      },
      frecency = {
        layout_config = {
          preview_width = 0.5
        },
      },
      diagnostics = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          preview_height = 0.7,
          vertical = {
            mirror = true,
          }
        },
      },
      git_bcommits = {
        layout_config = {
          preview_width = 0.7
        },
      }
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
      file_browser = {
        --cwd = utils.buffer_dir(),
        layout_config = {
          preview_width = 0.6
        },
      },
      lsp_workspace_symbols = {
        fname_width = 100,
        symbol_width = 95,
      },
      lsp_incoming_calls = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          preview_height = 0.8,
          vertical = {
            mirror = true,
          }
        },
      },
      lsp_outgoing_calls = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          preview_height = 0.8,
          vertical = {
            mirror = true,
          }
        },
      },
      cder = {
        dir_command = { 'fd', '--hidden', '--type=d', '.', os.getenv('HOME') .. '/code' },
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          -- even more opts
        }

        -- pseudo code / specification for writing custom displays, like the one
        -- for "codeactions"
        -- specific_opts = {
        --   [kind] = {
        --     make_indexed = function(items) -> indexed_items, width,
        --     make_displayer = function(widths) -> displayer
        --     make_display = function(displayer) -> function(e)
        --     make_ordinal = function(e) -> string
        --   },
        --   -- for example to disable the custom builtin "codeactions" display
        --      do the following
        --   codeactions = false,
        -- }
      }
    }
  }
  require('telescope').load_extension('fzy_native')
  --require('telescope').load_extension('dotfiles')
  require('telescope').load_extension('dap')
  require('telescope').load_extension('frecency')
  require("telescope").load_extension('file_browser')
  require('telescope').load_extension('cder')
  require('telescope').load_extension('telescope-tabs')
  require("telescope").load_extension("ui-select")
  -- require('telescope').load_extension('harpoon')
end

return config
