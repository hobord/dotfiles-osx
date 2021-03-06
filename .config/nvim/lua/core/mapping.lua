local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- Vim map
    ["n|<C-x>k"]         = map_cr('bdelete'):with_noremap():with_silent(),
    ["n|<C-s>"]          = map_cu('write'):with_noremap(),
    ["n|Y"]              = map_cmd('y$'),
    ["n|]w"]             = map_cu('WhitespaceNext'):with_noremap(),
    ["n|[w"]             = map_cu('WhitespacePrev'):with_noremap(),
    ["n|<C-PageUp>"]     = map_cu('bp'):with_noremap(),
    ["n|<C-PageDown>"]   = map_cu('bn'):with_noremap(),
    ["n|]b"]             = map_cu('bp'):with_noremap(),
    ["n|[b"]             = map_cu('bn'):with_noremap(),
    ["n|<C-S-PageUp>"]   = map_cu('BufferLineMovePrev'),
    ["n|<C-S-PageDown>"] = map_cu('BufferLineMoveNext'),
    ["n|<C-t><UP>"]      = map_cu('tabr'),
    ["n|<C-t><DOWN>"]    = map_cu('tabl'),
    ["n|<C-t><LEFT>"]    = map_cu('tabp'),
    ["n|<C-t><RIGHT>"]   = map_cu('tabn'),
    ["n|<C-t>n"]         = map_cu('tabnew'),
    ["n|<Leader>tc"]     = map_cu('tabclose'),
    ["n|<Space>cw"]      = map_cu([[silent! keeppatterns %substitute/\s\+$//e]]):with_noremap():with_silent(),
    ["n|<C-h>"]          = map_cmd('<C-w>h'):with_noremap(),
    ["n|<C-l>"]          = map_cmd('<C-w>l'):with_noremap(),
    ["n|<C-j>"]          = map_cmd('<C-w>j'):with_noremap(),
    ["n|<C-k>"]          = map_cmd('<C-w>k'):with_noremap(),
    ["n|<A-[>"]          = map_cr('vertical resize -5'):with_silent(),
    ["n|<A-]>"]          = map_cr('vertical resize +5'):with_silent(),
    ["n|<C-q>"]          = map_cmd(':wq<CR>'),
    ["n|<Leader>ss"]     = map_cu('SessionSave'):with_noremap(),
    ["n|<Leader>sl"]     = map_cu('SessionLoad'):with_noremap(),
    ["n|<Leader>n"]      = map_cmd(':noh<CR>'),
    ["n|<Leader>r"]      = map_cmd(':set relativenumber!<CR>'),
    ["n|<Leader>w"]      = map_cu('call EasyMotion#WB(1,2)'):with_noremap(),
    --["n|<Leader>l"]      = map_cu('call EasyMotion#JK(1,2)'):with_noremap(),
    --["n|<Leader>m"]      = map_cmd(':MinimapToggle<CR>'),
    --["n|<Leader>gd"]     = map_cmd(':Gdiff<CR>'),
  -- Insert
    ["i|<C-n>"]          = map_cmd("compe#complete()"):with_expr():with_silent():with_noremap(),
    ["i|<C-@>"]          = map_cmd('<ESC>'),
    ["i|<C-w>"]          = map_cmd('<C-[>diwa'):with_noremap(),
    ["i|<C-h>"]          = map_cmd('<BS>'):with_noremap(),
    --["i|<C-d>"]          = map_cmd('<Del>'):with_noremap(),
    --["i|<C-u>"]          = map_cmd('<C-G>u<C-U>'):with_noremap(),
    ["i|<C-u>"]          = map_cmd('<C-O>u'):with_noremap(),
    --["i|<C-a>"]          = map_cmd('<ESC>^i'):with_noremap(),
    ["i|<C-i>"]          = map_cmd('<C-O>^'):with_noremap(),
    ["i|<C-l>"]          = map_cmd('<ESC>A'):with_noremap(),
    ["i|<C-j>"]          = map_cmd('<Esc>o'):with_noremap(),
    ["i|<C-k>"]          = map_cmd('<Esc>O'):with_noremap(),
    ["i|<C-s>"]          = map_cmd('<Esc>:w<CR>'),
    ["i|<C-q>"]          = map_cmd('<Esc>:wq<CR>'),
    ["i|<C-e>"]          = map_cmd([[pumvisible() ? "\<C-e>" : "\<End>"]]):with_noremap():with_expr(),
  -- command line
    ["c|<C-a>"]          = map_cmd('<Home>'):with_noremap(),
    ["c|<C-e>"]          = map_cmd('<End>'):with_noremap(),
    ["c|<C-d>"]          = map_cmd('<Del>'):with_noremap(),
    ["c|<C-h>"]          = map_cmd('<BS>'):with_noremap(),
    ["c|<C-t>"]          = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
}

bind.nvim_load_mapping(def_map)
