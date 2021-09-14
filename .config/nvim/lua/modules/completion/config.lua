local config = {}

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.lsp_signature()
  require('lsp_signature').on_attach({
    bind = true,
    handler_opts = {
      border = "single",
      floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
      fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
      hint_enable = true, -- virtual hint enable
      hint_prefix = " ",  -- Panda for parameter
      hint_scheme = "String",
      use_lspsaga = true,  -- set to true if you want to use lspsaga popup
      hi_parameter = "Search", -- how your parameter will be highlight
      max_width = 120,
      toggle_key = '<M-x>', -- nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    },

  })
end

function config.lsp_trouble()
  require('trouble').setup {
    height = 15, -- height of the trouble list
    icons = true, -- use dev-icons for filenames
    mode = "workspace", -- "workspace" or "document"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    action_keys = { -- key mappings for actions in the trouble list
        close = "q", -- close the list
        refresh = "r", -- manually refresh
        jump = "<cr>", -- jump to the diagnostic or open / close folds
        toggle_mode = "m", -- toggle between "workspace" and "document" mode
        toggle_preview = "P", -- toggle auto_preview
        preview = "p", -- preview the diagnostic location
        close_folds = "zM", -- close all folds
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        open_folds = "zR", -- open all folds
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = true, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = ""
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  }
end

function config.nvim_compe()
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    --preselect = 'enable';
    preselect = 'disabled';
    select= true;
    keys = '<CR>';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = false;
      tags = true;
      snippets_nvim = true;
      vim_dadbod_completion = true
    };
  }
end

function config.vim_vsnip()
  vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'
end

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
    vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzy-native.nvim]]
  end
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
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
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
        --cwd = utils.buffer_dir(),
        layout_config = {
          preview_width = 0.6
        },
      },
      lsp_references = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          vertical = {
            mirror = true,
          }
        },
      },
      lsp_implementations = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          vertical = {
            mirror = true,
          }
        },
      },
      frecency = {
        layout_config = {
          preview_width = 0.5
        },
      }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
  }
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('dotfiles')
  require('telescope').load_extension('gosource')
  require('telescope').load_extension('dap')
  require('telescope').load_extension('frecency')
end

function config.vim_sonictemplate()
  vim.g.sonictemplate_postfix_key = '<C-,>'
  vim.g.sonictemplate_vim_template_dir = os.getenv("HOME").. '/.config/nvim/template'
end

function config.smart_input()
  require('smartinput').setup {
    ['go'] = { ';',':=',';' }
  }
end

function config.emmet()
  vim.g.user_emmet_complete_tag = 0
  vim.g.user_emmet_install_global = 0
  vim.g.user_emmet_install_command = 0
  vim.g.user_emmet_mode = 'i'
end

return config
