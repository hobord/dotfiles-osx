local vim = vim
local bind = require('core.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

local plug_map = {
    -- EasyAlign
    ["x|ga"]                = map_cmd('<Plug>(EasyAlign)'),
    ["n|<leader>/"]         = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- Packer
    ["n|<leader>pu"]        = map_cr("PackerUpdate"):with_silent():with_noremap():with_nowait(),
    ["n|<leader>pi"]        = map_cr("PackerInstall"):with_silent():with_noremap():with_nowait(),
    ["n|<leader>pc"]        = map_cr("PackerCompile"):with_silent():with_noremap():with_nowait(),
    ["n|<M-p>"]             = map_cr("Telescope neoclip unnamed"):with_silent():with_noremap():with_nowait(),
    -- Plugin Floaterm
    ["n|<Leader>t"]         = map_cu('lua require("FTerm").toggle()'):with_noremap():with_silent(),
    --["n|<Leader>t"]       = map_cu('FloatermToggle'):with_noremap():with_silent(),
    ["n|tt"]                = map_cr('FloatermNew --width=0.8 --height=0.8 --name=unitest --autoclose=1 make test'):with_noremap():with_silent(),
    ["n|<C-S-PageUp>"]      = map_cu('BufferLineMovePrev'),
    ["n|<C-S-PageDown>"]    = map_cu('BufferLineMoveNext'),
    ["n|<Leader>w"]         = map_cu('HopWord'):with_noremap(),
    ["n|<C-g>"]             = map_cu('HopChar1'):with_noremap(),
    ["n|<Leader>h"]         = map_cu('lua require("harpoon.ui").nav_file(1)'):with_silent():with_noremap(),
    ["n|<Leader>j"]         = map_cu('lua require("harpoon.ui").nav_file(2)'):with_silent():with_noremap(),
    ["n|<Leader>k"]         = map_cu('lua require("harpoon.ui").nav_file(3)'):with_silent():with_noremap(),
    ["n|<Leader>l"]         = map_cu('lua require("harpoon.ui").nav_file(4)'):with_silent():with_noremap(),
    ["n|<Leader><Leader>a"] = map_cu('lua require("harpoon.mark").add_file()'):with_silent():with_noremap(),
    ["n|<Leader>n"]         = map_cu('lua require("harpoon.ui").toggle_quick_menu()'):with_silent():with_noremap(),
    ["n|<Leader><Leader>g"] = map_cu('Neogit'):with_silent():with_noremap(),
    -- Plugin symbols_outline
    ["n|<C-f>"]             = map_cu('SymbolsOutline'):with_noremap():with_silent(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>xx"]        = map_cr("TroubleToggle"):with_noremap():with_silent():with_nowait(),
    ["n|[d"]                = map_cu('lua vim.diagnostic.goto_prev()'):with_noremap():with_silent(),
    ["n|]d"]                = map_cu('lua vim.diagnostic.goto_next()'):with_noremap():with_silent(),
    ["n|H"]                 = map_cr("lua vim.lsp.buf.hover({border='single'; max_width=80; max_heigt=40})"):with_noremap():with_silent(),
    ["n|<Leader>a"]         = map_cr("lua vim.lsp.buf.code_action()"):with_noremap():with_silent(),
    ["n|gD"]                = map_cu("lua require('goto-preview').goto_preview_definition()"):with_noremap():with_silent(),
    ["n|gd"]                = map_cu("lua vim.lsp.buf.definition()"):with_noremap():with_silent(),
    ["n|<Leader>fs"]        = map_cr('Telescope lsp_document_symbols'):with_noremap():with_silent(),
    ["n|<Leader>fS"]        = map_cr('Telescope lsp_dynamic_workspace_symbols'):with_noremap():with_silent(),
    ["n|<Leader>r"]         = map_cu('lua vim.lsp.buf.rename()'):with_noremap():with_silent(),
    ["n|<Leader>fu"]        = map_cr('Telescope lsp_references'):with_noremap():with_silent(),
    ["n|gh"]                = map_cr('Telescope git_bcommits'):with_noremap():with_silent(),
    ["n|cd"]                = map_cr('Telescope cder'):with_noremap():with_silent(),
    ["n|gt"]                = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    -- Plugin nvim-tree
    ["n|<C-e>"]         = map_cr('Neotree reveal toggle left focus'):with_noremap():with_silent(),
    -- ["n|<Leader>e"]         = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    -- Plugin Telescope
    ["n|<Leader>b"]         = map_cu('Telescope buffers'):with_noremap():with_silent(),
    ["n|<Leader><Leader>z"] = map_cu("ZenMode"):with_noremap():with_silent(),
    ["n|<Leader>fh"]        = map_cu("lua require('telescope').extensions.frecency.frecency()"):with_noremap():with_silent(),
    ["n|<Leader>fb"]        = map_cu("lua require('telescope').extensions.file_browser.file_browser()"):with_noremap():with_silent(),
    ["n|<Leader>d"]         = map_cu("lua require('telescope').extensions.file_browser.file_browser({ cwd = vim.fn.expand('%:p:h'), })"):with_noremap():with_silent(),
    -- ["n|<Leader>fb"]        = map_cu("lua require'telescope.builtin'.file_browser()"):with_noremap():with_silent(),
    ["n|<Leader>ff"]        = map_cu('Telescope find_files find_command=rg,--hidden,--files'):with_noremap():with_silent(),
    --["n|<Leader>fgi"]     = map_cu('Telescope git_files'):with_noremap():with_silent(),
    ["n|<Leader>fg"]        = map_cu('Telescope live_grep'):with_noremap():with_silent(),
    ["n|<Leader>z"]        = map_cu('Telescope resume'):with_noremap():with_silent(),
    ["n|<Leader>f/"]        = map_cu('Telescope current_buffer_fuzzy_find'):with_noremap():with_silent(),
    ["n|<Leader>fw"]        = map_cu('Telescope grep_string'):with_noremap():with_silent(),
    ["n|<Leader>fi"]        = map_cr('Telescope lsp_implementations'):with_noremap():with_silent(),
    --["n|<Leader>fh"]      = map_cu('DashboardFindHistory'):with_noremap():with_silent(),
    ["n|<Leader>fl"]        = map_cu('Telescope loclist'):with_noremap():with_silent(),
    ["n|<Leader>fc"]        = map_cu('Telescope git_commits'):with_noremap():with_silent(),
    ["n|<Leader>ft"]        = map_cu('Telescope help_tags'):with_noremap():with_silent(),
    ["n|<Leader>fr"]        = map_cu("lua require'telescope.builtin'.lsp_references{}"):with_noremap():with_silent(),
    ["n|<Leader><Leader>b"] = map_cu("lua require'dap'.toggle_breakpoint()"):with_noremap():with_nowait():with_silent(),
    ["n|<Leader><Leader>B"] = map_cu("lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition:'))"):with_noremap():with_nowait():with_silent(),
    ["n|<Leader><Leader>d"] = map_cu("lua require'dapui'.toggle()"):with_noremap():with_nowait():with_silent(),
    ["n|<Leader><Leader>s"] = map_cu("lua require'telescope'.extensions.dap.configurations{}"):with_noremap():with_nowait():with_silent(),
    ["n|<Leader><Leader>c"] = map_cu("lua require'dap'.continue()"):with_noremap():with_nowait():with_silent(),
    ["n|<F5>"]              = map_cu("lua require'dap'.continue()"):with_noremap():with_nowait():with_silent(),
    ["n|<F10>"]             = map_cu("lua require'dap'.step_over()"):with_noremap():with_nowait():with_silent(),
    ["n|<F9>"]              = map_cu("lua require'dap'.step_into()"):with_noremap():with_nowait():with_silent(),
    ["n|<F8>"]              = map_cu("lua require'dap'.step_out()"):with_noremap():with_nowait():with_silent(),
    ["n|<F12>"]             = map_cu("lua require'dap'.disconnect()"):with_noremap():with_nowait():with_silent(),
    -- Plugin acceleratedjk
    ["n|j"]                 = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    ["n|k"]                 = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
    -- Plugin QuickRun
    --["n|<Leader>r"]       = map_cr("<cmd> lua require'internal.quickrun'.run_command()"):with_noremap():with_silent(),
    -- Plugin hrsh7th/vim-eft
    ["n|;"]                 = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["x|;"]                 = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["n|f"]                 = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["x|f"]                 = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["o|f"]                 = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"]                 = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["x|F"]                 = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["o|F"]                 = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    -- Plugin vim-operator-surround
    --["n|sa"]              = map_cmd("<Plug>(operator-surround-append)"):with_silent(),
    --["n|sd"]              = map_cmd("<Plug>(operator-surround-delete)"):with_silent(),
    --["n|sr"]              = map_cmd("<Plug>(operator-surround-replace)"):with_silent(),
    -- Plugin vim_niceblock
    --["x|I"]               = map_cmd("v:lua.enhance_nice_block('I')"):with_expr(),
    --["x|gI"]              = map_cmd("v:lua.enhance_nice_block('gI')"):with_expr(),
    --["x|A"]               = map_cmd("v:lua.enhance_nice_block('A')"):with_expr(),
    ["i|<C-Down>"]          = map_cmd('copilot#Accept("<CR>")'):with_noremap():with_silent():with_expr(),
  };

bind.nvim_load_mapping(plug_map)

