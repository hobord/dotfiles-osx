local vim = vim
local map = vim.keymap.set

cmd = function(str)
  return ":" .. str .. "<cr>"
end

map("n", "<Leader><Leader>z",  cmd("ZenMode"), { noremap = true, silent = true, desc="ZenMode" })

  -- EasyAlign
map("n", "s",                  function() require('leap').leap { target_windows = { vim.fn.win_getid() } } end, { noremap = true, silent = true, desc="Leap" })
map("x", "ga",                 '<Plug>(EasyAlign)', { noremap = true, silent = true, desc="EasyAlign" })

  -- Packer
map("n", "<leader><leader>Pu",         cmd("PackerUpdate"), { noremap = true, silent = true, nowait = true, desc="Packer Update" })
map("n", "<leader><leader>Pi",         cmd("PackerInstall"), { noremap = true, silent = true, nowait = true, desc="Packer Install" })
map("n", "<leader><leader>Pc",         cmd("PackerCompile"), { noremap = true, silent = true, nowait = true, desc="Packer Compile" })

-- Terminal
map("n", "<Leader>`",          cmd("ToggleTerm size=20"), { noremap = true, silent = true, desc="Terminal" })
map("n", "<Leader>~",          cmd("ToggleTerm direction=float"), { noremap = true, silent = true, desc="Terminal float" })

-- Buffer navigation
map("n", "<C-S-PageUp>",       'BufferLineMovePrev', { noremap = true, silent = true, nowait = true })
map("n", "<C-S-PageDown>",     'BufferLineMoveNext', { noremap = true, silent = true, nowait = true })

-- Hop
map("n", "<Leader>w",          cmd('HopWord'), { noremap = true, silent = true, desc="Hop Word" })
map("n", "<C-g>",              cmd('HopChar1'), { noremap = true, silent = true, desc="Hop Char" })

-- Harpoon
-- map("n", "<Leader>h",          function() require("harpoon.ui").nav_file(1) end, { noremap = true, silent = true, desc="Harpoon file1" })
-- map("n", "<Leader>j",          function() require("harpoon.ui").nav_file(2) end, { noremap = true, silent = true, desc="Harpoon file2" })
-- map("n", "<Leader>k",          function() require("harpoon.ui").nav_file(3) end, { noremap = true, silent = true, desc="Harpoon file3" })
-- map("n", "<Leader>l",          function() require("harpoon.ui").nav_file(4) end, { noremap = true, silent = true, desc="Harpoon file4" })
-- map("n", "<Leader><Leader>a",  function() require("harpoon.mark").add_file() end, { noremap = true, silent = true, desc="Harpoon add file" })
-- map("n", "<Leader>n",          function() require("harpoon.ui").toggle_quick_menu() end, { noremap = true, silent = true, desc="Harpoon Menu" })

-- Git
map("n", "<Leader>gg",  cmd("Neogit"), { noremap = true, silent = true, desc="Neogit" })
map("n", "<Leader>gh",  cmd("DiffviewFileHistory %"), { noremap = true, silent = true, desc="Diffview Current File History" })
map("n", "<Leader>gH",  cmd("DiffviewFileHistory"), { noremap = true, silent = true, desc="Diffview File History" })
map("n", "<Leader>gs",  cmd("Gitsigns toggle_signs"), { noremap = true, silent = true, desc="Toggle Gitsigns" })
map("n", "<Leader>gb",  cmd("Gitsigns blame_line"), { noremap = true, silent = true, desc="Blame line" })
-- map("n", "fgi",      cmd('Telescope git_files'), { noremap = true, silent = true })
map("n", "<Leader>gC",  cmd('Telescope git_commits'), { noremap = true, silent = true, desc="List Git commits" })
map("n", "<Leader>gc",  cmd('Telescope git_bcommits'), { noremap = true, silent = true, desc="Git file commits" })
map("n", "<Leader>gt",  cmd('Telescope git_status'), { noremap = true, silent = true, desc="Git status" })
map("n", "<Leader>gS",  cmd('Telescope git_stash'), { noremap = true, silent = true, desc="Git stash" })
map("n", "<Leader>gB",  cmd('Telescope git_branches'), { noremap = true, silent = true, desc="Git branches" })

  -- Plugin symbols_outline
-- map("n", "<C-f>",              cmd('AerialToggle!'), { noremap = true, silent = true })
-- map("n", "<Leader>lv",         cmd('Telescope aerial'), { noremap = true, silent = true })

  -- Lsp mapp work when insertenter and lsp start
-- map("n", "<leader>lx",         cmd("TroubleToggle"), { noremap = true, silent = true, nowait = true, desc="Toggle trouble list" })
map("n", "<Leader>lx",         cmd('Telescope diagnostics bufnr=0'), { noremap = true, silent = true, desc="Diagnostics" })
map("n", "<Leader>lX",         cmd('Telescope diagnostics'), { noremap = true, silent = true, desc="Workspace Diagnostics" })
map("n", "[d",                 function() vim.diagnostic.goto_prev() end, { noremap = true, silent = true, desc="Diagnostic prev" })
map("n", "]d",                 function() vim.diagnostic.goto_next() end, { noremap = true, silent = true, desc="Diagnostic next" })
map("n", "H",                  function() vim.lsp.buf.hover({border='single'; max_width=80; max_heigt=40}) end, { noremap = true, silent = true, desc="Hover" })
map("n", "<Leader>la",         function() vim.lsp.buf.code_action() end, { noremap = true, silent = true, desc="Action" })
map("n", "<Leader>lp",         function() require('goto-preview').goto_preview_definition() end, { noremap = true, silent = true, desc="Preview definition" })
map("n", "<Leader>ld",         function() vim.lsp.buf.definition() end, { noremap = true, silent = true, desc="Definition" })
map("n", "<Leader>ls",         function() require('telescope.builtin').lsp_document_symbols({fname_width = 200,symbol_width = 160 }) end, { noremap = true, silent = true, desc="Document symbols" })
map("n", "<Leader>lS",         cmd('Telescope lsp_dynamic_workspace_symbols'), { noremap = true, silent = true, desc="Workspace symbols" })
map("n", "<Leader>lr",         function() vim.lsp.buf.rename() end, { noremap = true, silent = true, desc="Rename" })
map("n", "<Leader>lR",         cmd('Telescope lsp_references'), { noremap = true, silent = true, desc="References" })
map("n", "<Leader>lt",          function() vim.lsp.buf.type_definition() end, { noremap = true, silent = true, desc="Type definition" })
map("n", "<Leader>li",         cmd('Telescope lsp_implementations'), { noremap = true, silent = true, desc="Implementations" })
map("n", "<Leader>lc",         cmd('Telescope lsp_incoming_calls'), { noremap = true, silent = true, desc="Callers" })
map("n", "<Leader>lo",         cmd('Telescope lsp_outgoing_calls'), { noremap = true, silent = true, desc="Cals" })

-- Plugin nvim-tree
map("n", "<C-e>",              cmd('Neotree reveal toggle left focus'), { noremap = true, silent = true, desc="Neotree toggle" })

  -- Plugin Telescope
map("n", "<Leader>/",          cmd('Telescope resume'), { noremap = true, silent = true, desc="Telescope resume" })

map("n", "<Leader>tl",         cmd('Telescope telescope-tabs list_tabs'), { noremap = true, silent = true, desc="List tabs" })
map("n", "<Leader>tk",         function() require('telescope-tabs').go_to_previous() end, { noremap = true, silent = true, desc="Go to previous tab" })
map('n', '<Leader>tn',         cmd('tab split'), { noremap = true, silent = true, desc="New tab" })
map('n', '<Leader>tc',         cmd('tabclose'), { noremap = true, silent = true, desc="Close tab" })

map("n", "<M-p>",              cmd("Telescope neoclip unnamed"), { noremap = true, silent = true, nowait = true, desc="Telescope neoclip unnamed" })

map("n", "<Leader>b",          cmd('Telescope buffers'), { noremap = true, silent = true, desc="List buffers" })
map("n", "cd",                 cmd('Telescope cder'), { noremap = true, silent = true, desc="Cder" })
map("n", "<Leader>fh",         function() require('telescope').extensions.frecency.frecency() end, { noremap = true, silent = true, desc="Frecency" })
map("n", "<Leader>fb",         function() require('telescope').extensions.file_browser.file_browser() end, { noremap = true, silent = true, desc="File browser" })
map("n", "<Leader>d",          function() require('telescope').extensions.file_browser.file_browser({ cwd = vim.fn.expand('%:p:h'), }) end, { noremap = true, silent = true, desc="File browser current dir" })
map("n", "<Leader>fr",         cmd('Telescope oldfiles'), { noremap = true, silent = true, desc="Recent files" })
map("n", "<Leader>ff",         cmd('Telescope find_files find_command=rg,--hidden,--files'), { noremap = true, silent = true, desc="Find files" })
map("n", "<Leader>fg",         cmd('Telescope live_grep'), { noremap = true, silent = true, desc="Live grep" })
map("n", "<Leader>fw",         cmd('Telescope grep_string'), { noremap = true, silent = true, desc="Grep string" })
map("n", "<Leader>fz",         cmd('Telescope current_buffer_fuzzy_find'), { noremap = true, silent = true, desc="Current buffer fuzzy find" })
map("n", "<Leader>fl",         cmd('Telescope loclist'), { noremap = true, silent = true, desc="Loclist" })
map("n", "<Leader>ft",         cmd('Telescope help_tags'), { noremap = true, silent = true, desc="List help tags" })
map('n', '<Leader>m',          cmd('Telescope marks'), { noremap = true, silent = true, desc = 'List marks' })

-- DAP
map("n", "<Leader>rb",  function() require'dap'.toggle_breakpoint() end, { noremap = true, silent = true, nowait = true, desc="Toggle breakpoint" })
map("n", "<Leader>rB",  function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition:')) end, { noremap = true, silent = true, nowait = true, desc="Set breakpoint condition" })
map("n", "<Leader>rd",  function() require'dapui'.toggle() end, { noremap = true, silent = true, nowait = true, desc="Toggle DAP UI" })
map("n", "<Leader>rc",  function() require'telescope'.extensions.dap.configurations{} end, { noremap = true, silent = true, nowait = true, desc="DAP configurations" })
map("n", "<Leader>rr",  function() require'dap'.continue() end, { noremap = true, silent = true, nowait = true, desc="DAP continue <F5>" })
map("n", "<F5>",        function() require'dap'.continue() end, { noremap = true, silent = true, nowait = true, desc="DAP continue" })
map("n", "<F10>",       function() require'dap'.step_over() end, { noremap = true, silent = true, nowait = true, desc="DAP step over" })
map("n", "<Leader>rn",  function() require'dap'.step_over() end, { noremap = true, silent = true, nowait = true, desc="DAP step over <F10>" })
map("n", "<F11>",       function() require'dap'.step_into() end, { noremap = true, silent = true, nowait = true, desc="DAP step into" })
map("n", "<Leader>ri",  function() require'dap'.step_into() end, { noremap = true, silent = true, nowait = true, desc="DAP step into <F11>" })
map("n", "<F9>",        function() require'dap'.step_out() end, { noremap = true, silent = true, nowait = true, desc="DAP step out" })
map("n", "<Leader>ro",  function() require'dap'.step_out() end, { noremap = true, silent = true, nowait = true, desc="DAP step out <F9>" })
-- map("n", "<Leader>re",  function() require'dap'.disconnect() end, { noremap = true, silent = true, nowait = true, desc="DAP disconnect" })
map("n", "<Leader>rt",  function() require('gotest').run_test() end, { noremap = true, silent = true, nowait = true, desc="Run test" })
map("n", "<Leader>r[",  function() require('gotest').clean_last_run() end, { noremap = true, silent = true, nowait = true, desc="CleanLastRun" })
map("n", "<Leader>re",  function() require('gotest').show_last_test_result() end, { noremap = true, silent = true, nowait = true, desc="Show test result" })
map("n", "<Leader>rT",  function() require('dap-go').debug_test() end, { noremap = true, silent = true, nowait = true, desc="DAP Debug test" })
map("n", "<Leader>rh",  function() require'dap.ui.widgets'.hover() end, { noremap = true, silent = true, nowait = true, desc="DAP Hoover" })
map("n", "<Leader>rv",  function() require'nvim-dap-virtual-text'.toggle() end, { noremap = true, silent = true, nowait = true, desc="DAP virtual text toggle" })
map("n", "<Leader>rs",  function() require'dap'.terminate() end, { noremap = true, silent = true, nowait = true, desc="DAP Terminate" })

  -- Plugin acceleratedjk
vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})

  -- Plugin hrsh7th/vim-eft
vim.api.nvim_set_keymap("n", ";",                  "<Plug>(eft-repeat)", {})
vim.api.nvim_set_keymap("x", ";",                  "<Plug>(eft-repeat)", {})
vim.api.nvim_set_keymap("o", ";",                  "<Plug>(eft-repeat)", {})

vim.api.nvim_set_keymap("n", "f",                  "<Plug>(eft-f)", {})
vim.api.nvim_set_keymap("x", "f",                  "<Plug>(eft-f)", {})
vim.api.nvim_set_keymap("o", "f",                  "<Plug>(eft-f)", {})
vim.api.nvim_set_keymap("n", "F",                  "<Plug>(eft-F)", {})
vim.api.nvim_set_keymap("x", "F",                  "<Plug>(eft-F)", {})
vim.api.nvim_set_keymap("o", "F",                  "<Plug>(eft-F)", {})

vim.api.nvim_set_keymap("n", "t",                  "<Plug>(eft-t)", {})
vim.api.nvim_set_keymap("x", "t",                  "<Plug>(eft-t)", {})
vim.api.nvim_set_keymap("o", "t",                  "<Plug>(eft-t)", {})
vim.api.nvim_set_keymap("n", "T",                  "<Plug>(eft-T)", {})
vim.api.nvim_set_keymap("x", "T",                  "<Plug>(eft-T)", {})
vim.api.nvim_set_keymap("o", "T",                  "<Plug>(eft-T)", {})

map("i", "<C-l>",          function() require('copilot.suggestion').accept() end, { noremap = true, silent = true, nowait = true, expr = true })


local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    f = {
      name = "Find",
    },
    g = {
      name = "Git",
    },
    r = {
      name = "Run",
    },
    l = {
      name = "LSP",
    },
    t = {
      name = "Tabs",
    },
  },
  ["<leader><leader>"] = {
    P = {
      name = "Packer",
    },
  }
})
