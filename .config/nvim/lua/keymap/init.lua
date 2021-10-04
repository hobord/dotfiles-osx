local bind     = require('keymap.bind')
local map_cr   = bind.map_cr
local map_cu   = bind.map_cu
local map_cmd  = bind.map_cmd
local map_args = bind.map_args
require('keymap.config')

local plug_map = {
    -- EasyAlign
    ["x|ga"]            = map_cmd('<Plug>(EasyAlign)');
    ["i|<Tab>"]         = map_cmd([[compe#confirm({'keys': "\<Tab>", 'mode': 'n', 'select': v:true})]]):with_expr():with_noremap():with_silent(),
    --["n|gb"]            = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- Packer
    ["n|<leader>pu"]    = map_cr("PackerUpdate"):with_silent():with_noremap():with_nowait(),
    ["n|<leader>pi"]    = map_cr("PackerInstall"):with_silent():with_noremap():with_nowait(),
    ["n|<leader>pc"]    = map_cr("PackerCompile"):with_silent():with_noremap():with_nowait(),
    ["n|<M-p>"]         = map_cr("Telescope neoclip unnamed"):with_silent():with_noremap():with_nowait(),
    -- Plugin Floaterm
    ["n|<Leader>t"]     = map_cu('lua require("FTerm").toggle()'):with_noremap():with_silent(),
    --["n|<Leader>t"]     = map_cu('FloatermToggle'):with_noremap():with_silent(),
    ["n|tt"]            = map_cr('FloatermNew --width=0.8 --height=0.8 --name=unitest --autoclose=1 make test'):with_noremap():with_silent(),
    -- Plugin Vista
    ["n|<Leader>v"]     = map_cu('Vista!!'):with_noremap():with_silent(),
    -- Plugin symbols_outline
    ["n|<C-f>"]         = map_cu('SymbolsOutline'):with_noremap():with_silent(),
    -- Lsp mapp work when insertenter and lsp start
    --["n|<leader>li"]    = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
    --["n|<leader>ll"]    = map_cr("LspLog"):with_noremap():with_silent():with_nowait(),
    --["n|<leader>lr"]    = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>xx"]    = map_cr("LspTroubleToggle"):with_noremap():with_silent():with_nowait(),
    --["n|<C-f>"]         = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"):with_silent():with_noremap():with_nowait(),
    --["n|<C-b>"]         = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"):with_silent():with_noremap():with_nowait(),
    ["n|[e"]            = map_cr('Lspsaga diagnostic_jump_next'):with_noremap():with_silent(),
    ["n|]e"]            = map_cr('Lspsaga diagnostic_jump_prev'):with_noremap():with_silent(),
    ["n|H"]             = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|<Leader>a"]     = map_cr("Telescope lsp_code_actions"):with_noremap():with_silent(),
    --["v|<Leader>a"]     = map_cu("Lspsaga range_code_action"):with_noremap():with_silent(),
    ["n|<leader>h"]     = map_cr('Lspsaga preview_definition'):with_noremap():with_silent(),
    --["n|gD"]            = map_cu("lua require('goto-preview').goto_preview_definition()"):with_noremap():with_silent(),
    ["n|gd"]            = map_cu("lua vim.lsp.buf.definition()"):with_noremap():with_silent(),
    ["n|<Leader>fs"]            = map_cr('Telescope lsp_dynamic_workspace_symbols'):with_noremap():with_silent(),
    --["n|gs"]            = map_cr('Lspsaga signature_help'):with_noremap():with_silent(),
    ["n|<Leader>r"]     = map_cr('Lspsaga rename'):with_noremap():with_silent(),
    ["n|<Leader>fu"]            = map_cr('Telescope lsp_references'):with_noremap():with_silent(),
    ["n|gh"]            = map_cr('Telescope git_bcommits'):with_noremap():with_silent(),
    ["n|gt"]            = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    --["n|<Leader>cw"]    = map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap():with_silent(),
    --["n|<Leader>ce"]    = map_cr('Lspsaga show_line_diagnostics'):with_noremap():with_silent(),
    ["n|<Leader>ct"]    = map_args("Template"),
    --["n|<Leader>tf"]    = map_cu('DashboardNewFile'):with_noremap():with_silent(),
    ["n|<Leader>j"]     = map_cu('Telescope jumplist'):with_noremap():with_silent(),
    -- Plugin nvim-tree
    ["n|<Leader>e"]     = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    ["n|<Leader>F"]     = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
    -- Plugin Telescope
    ["n|<Leader>b"]     = map_cu('Telescope buffers'):with_noremap():with_silent(),
    --["n|<Leader>fa"]    = map_cu('DashboardFindWord'):with_noremap():with_silent(),
    --["n|<Leader>fb"]    = map_cu('Telescope file_browser'):with_noremap():with_silent(),
    ["n|<Leader><Leader>z"] = map_cu("ZenMode"):with_noremap():with_silent(),
    ["n|<Leader>fh"]    = map_cu("lua require('telescope').extensions.frecency.frecency()"):with_noremap():with_silent(),
    ["n|<Leader>fb"]    = map_cu("lua require'telescope.builtin'.file_browser()"):with_noremap():with_silent(),
    ["n|<Leader>ff"]    = map_cu('Telescope find_files find_command=rg,--hidden,--files'):with_noremap():with_silent(),
    --["n|<Leader>fgi"]   = map_cu('Telescope git_files'):with_noremap():with_silent(),
    ["n|<Leader>fg"]    = map_cu('Telescope live_grep'):with_noremap():with_silent(),
    ["n|<Leader>f/"]    = map_cu('Telescope current_buffer_fuzzy_find'):with_noremap():with_silent(),
    ["n|<Leader>fw"]    = map_cu('Telescope grep_string'):with_noremap():with_silent(),
    ["n|<Leader>fi"]    = map_cr('Telescope lsp_implementations'):with_noremap():with_silent(),
    --["n|<Leader>fh"]    = map_cu('DashboardFindHistory'):with_noremap():with_silent(),
    ["n|<Leader>fl"]    = map_cu('Telescope loclist'):with_noremap():with_silent(),
    ["n|<Leader>fc"]    = map_cu('Telescope git_commits'):with_noremap():with_silent(),
    ["n|<Leader>ft"]    = map_cu('Telescope help_tags'):with_noremap():with_silent(),
    ["n|<Leader>fr"]    = map_cu("lua require'telescope.builtin'.lsp_references{}"):with_noremap():with_silent(),
    ["n|<Leader><Leader>b"]        = map_cu("lua require'dap'.toggle_breakpoint()"):with_noremap():with_nowait():with_silent(),
    ["n|<Leader><Leader>d"]        = map_cu("lua require'dapui'.toggle()"):with_noremap():with_nowait():with_silent(),
    ["n|<Leader><Leader>s"]    = map_cu("lua require'dap'.continue()"):with_noremap():with_nowait():with_silent(),
    ["n|<Leader>n"]         = map_cu("lua require'dap'.step_over()"):with_noremap():with_nowait():with_silent(),
    ["n|<Leader>i"]     = map_cu("lua require'dap'.step_into()"):with_noremap():with_nowait():with_silent(),
    ["n|<Leader>o"]     = map_cu("lua require'dap'.step_out()"):with_noremap():with_nowait():with_silent(),
    -- Plugin acceleratedjk
    ["n|j"]             = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    ["n|k"]             = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
    -- Plugin QuickRun
    --["n|<Leader>r"]     = map_cr("<cmd> lua require'internal.quickrun'.run_command()"):with_noremap():with_silent(),
    -- Plugin hrsh7th/vim-eft
    ["n|;"]             = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["x|;"]             = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["n|f"]             = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["x|f"]             = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["o|f"]             = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"]             = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["x|F"]             = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["o|F"]             = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    --["n|<Leader>fw"]  = map_cu('Telescope grep_string'):with_noremap():with_silent(),
    --["n|<Leader>fd"]  = map_cu('Telescope dotfiles path='..os.getenv("HOME")..'/.dotfiles'):with_noremap():with_silent(),
    --["n|<Leader>fs"]  = map_cu('Telescope gosource'):with_noremap():with_silent(),
    --["n|<Leader>vdc"] = map_cu("lua vim.lsp.buf.declaration()"):with_noremap():with_silent(),
    --["n|<Leader>vd"]  = map_cu("lua vim.lsp.buf.definition()"):with_noremap():with_silent(),
    --["n|<Leader>vtd"] = map_cu("lua vim.lsp.buf.type_definition()"):with_noremap():with_silent(),
    --["n|<Leader>vi"]  = map_cu("lua vim.lsp.buf.implementation()"):with_noremap():with_silent(),
    --["n|<Leader>vsh"] = map_cu("lua vim.lsp.buf.signature_help()"):with_noremap():with_silent(),
    --["n|<Leader>vrr"] = map_cu("lua vim.lsp.buf.references()"):with_noremap():with_silent(),
    --["n|<Leader>vrn"] = map_cu("lua vim.lsp.buf.rename()"):with_noremap():with_silent(),
    --["n|<Leader>vh"]  = map_cu("lua vim.lsp.buf.hover()"):with_noremap():with_silent(),
    --["n|<Leader>vds"] = map_cu("lua vim.lsp.buf.document_symbol()"):with_noremap():with_silent(),
    --["n|<Leader>vws"] = map_cu("lua vim.lsp.buf.workspace_symbol()"):with_noremap():with_silent(),
    --["n|<Leader>vca"] = map_cu("lua vim.lsp.buf.code_action()"):with_noremap():with_silent(),
    --["n|<Leader>vsd"] = map_cu("lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()"):with_noremap():with_silent(),
    -- Far.vim
    --["n|<Leader>fz"]  = map_cr('Farf'):with_noremap():with_silent();
    --["v|<Leader>fz"]  = map_cr('Farf'):with_noremap():with_silent();
    -- prodoc
    --["n|gcc"]         = map_cu('ProComment'):with_noremap():with_silent(),
    --["x|gcc"]         = map_cr('ProComment'),
    --["n|gcj"]         = map_cu('ProDoc'):with_silent():with_silent(),
    -- Plugin MarkdownPreview
    --["n|<Leader>md"]  = map_cu('MarkdownPreview'):with_noremap():with_silent(),
    -- Plugin DadbodUI
    --["n|<Leader>od"]  = map_cr('DBUIToggle'):with_noremap():with_silent(),
    -- Plugin Floaterm
    --["n|<A-d>"]       = map_cu('Lspsaga open_floaterm'):with_noremap():with_silent(),
    --["t|<A-d>"]       = map_cu([[<C-\><C-n>:Lspsaga close_floaterm<CR>]]):with_noremap():with_silent(),
    --["n|<Leader>g"]   = map_cu("Lspsaga open_floaterm lazygit"):with_noremap():with_silent(),
    -- Plugin vim-operator-surround
    --["n|sa"]          = map_cmd("<Plug>(operator-surround-append)"):with_silent(),
    --["n|sd"]          = map_cmd("<Plug>(operator-surround-delete)"):with_silent(),
    --["n|sr"]          = map_cmd("<Plug>(operator-surround-replace)"):with_silent(),
    -- Plugin vim_niceblock
    --["x|I"]           = map_cmd("v:lua.enhance_nice_block('I')"):with_expr(),
    --["x|gI"]          = map_cmd("v:lua.enhance_nice_block('gI')"):with_expr(),
    --["x|A"]           = map_cmd("v:lua.enhance_nice_block('A')"):with_expr(),
  };

bind.nvim_load_mapping(plug_map)
