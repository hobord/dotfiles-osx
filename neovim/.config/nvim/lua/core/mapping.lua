local vim = vim
local bind = require('core.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd


vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', ' ', '', { noremap = true })
vim.api.nvim_set_keymap('x', ' ', '', { noremap = true })

-- default map
local def_map = {
  -- Vim map
  ["n|zi"]             = map_cmd('zi:let &l:fdc=&l:fen*&g:fdc<CR>'):with_noremap():with_silent(),
  -- ["n|d"]                 = map_cmd('"dd'):with_noremap():with_silent(),
  -- ["n|dp"]                = map_cmd('"dp'):with_noremap():with_silent(),
  -- ["n|dP"]                = map_cmd('"dP'):with_noremap():with_silent(),
  ["n|Y"]              = map_cmd('y$'),
  ["n|<C-x>k"]         = map_cr('bdelete'):with_noremap():with_silent(),
  ["n|<C-s>"]          = map_cr('write'):with_noremap():with_silent(),
  ["n|<C-PageUp>"]     = map_cr('bp'):with_noremap():with_silent(),
  ["n|<C-PageDown>"]   = map_cr('bn'):with_noremap():with_silent(),
  ["n|]b"]             = map_cr('bp'):with_noremap():with_silent(),
  ["n|[b"]             = map_cr('bn'):with_noremap():with_silent(),
  ["n|<C-S-PageUp>"]   = map_cr('BufferLineMovePrev'):with_noremap():with_silent(),
  ["n|<C-S-PageDown>"] = map_cr('BufferLineMoveNext'):with_noremap():with_silent(),
  -- ["n|<C-t>h"]            = map_cr('tabr'):with_noremap():with_silent(),
  -- ["n|<C-t>l"]            = map_cr('tabl'):with_noremap():with_silent(),
  ["n|<C-t>j"]         = map_cr('tabp'):with_noremap():with_silent(),
  ["n|<C-t>k"]         = map_cr('tabn'):with_noremap():with_silent(),
  ["n|<C-t>n"]         = map_cr('tab split'):with_noremap():with_silent(),
  ["n|<C-t>c"]         = map_cr('tabclose'):with_noremap():with_silent(),
  --["n|<Space>cw"]       = map_cr([[silent! keeppatterns %substitute/\s\+$//e]]):with_noremap():with_silent(),
  ["n|<C-c>"]          = map_cr('q!'):with_noremap(),
  ["n|<M-q>"]          = map_cr('qall!'):with_noremap(),
  ["n|<C-h>"]          = map_cmd('<C-w>h'):with_noremap(),
  ["n|<C-l>"]          = map_cmd('<C-w>l'):with_noremap(),
  ["n|<C-j>"]          = map_cmd('<C-w>j'):with_noremap(),
  ["n|<C-k>"]          = map_cmd('<C-w>k'):with_noremap(),
  ["n|<A-[>"]          = map_cr('vertical resize -5'):with_silent(),
  ["n|<A-]>"]          = map_cr('vertical resize +5'):with_silent(),

  -- ["n|<M-j>"] = map_cr("lua require('tree-climber').goto_next()"):with_noremap():with_silent(),
  -- ["n|<M-k>"] = map_cr("lua require('tree-climber').goto_prev()"):with_noremap():with_silent(),
  -- ["n|<M-l>"] = map_cr("lua require('tree-climber').goto_child()"):with_noremap():with_silent(),
  -- ["n|<M-h>"] = map_cr("lua require('tree-climber').goto_parent()"):with_noremap():with_silent(),

  -- swap lines up and down
  -- ["n|<M-j>"]             = map_cmd(':m .+1<cr>=='):with_noremap():with_silent(),
  -- ["n|<M-k>"]             = map_cmd(':m .-2<cr>=='):with_noremap():with_silent(),
  -- ["i|<M-j>"]             = map_cmd("<esc>:m .+1<cr>==gi"):with_noremap():with_silent(),
  -- ["i|<M-k>"]             = map_cmd("<esc>:m .-2<cr>==gi"):with_noremap():with_silent(),
  -- ["v|<M-j>"]             = map_cmd(":m '>+1<cr>gv=gv"):with_noremap():with_silent(),
  -- ["v|<M-k>"]             = map_cmd(":m '<-2<cr>gv=gv"):with_noremap():with_silent(),

  ["n|<C-q>"]             = map_cr('wq'),
  -- ["n|<Leader>ss"]        = map_cu('SessionSave'):with_noremap(),
  -- ["n|<Leader>sl"]        = map_cu('SessionLoad'):with_noremap(),
  ["n|<Leader>m"]         = map_cr('noh'),
  ["n|<Leader><Leader>r"] = map_cr('set relativenumber!'),
  ["n|<Leader><Leader>w"] = map_cr('set wrap!'),
  --["i|<C-@>"]           = map_cmd('<ESC>'),
  ["i|<C-w>"]             = map_cmd('<C-[>diwa'):with_noremap(),
  ["i|<C-u>"]             = map_cmd('<C-O>u'):with_noremap(),
  -- ["i|<C-i>"]             = map_cmd('<C-O>^'):with_noremap(),
  -- ["i|<C-l>"]             = map_cmd('<ESC>A'):with_noremap(),
  ["i|<C-j>"]             = map_cmd('<Esc>o'):with_noremap(),
  ["i|<C-k>"]             = map_cmd('<Esc>O'):with_noremap(),
  ["i|<C-s>"]             = map_cmd('<Esc>:w<CR>'),
  ["i|<C-q>"]             = map_cmd('<Esc>:wq<CR>'),
  --["i|<C-e>"]           = map_cmd([[pumvisible() ? "\<C-e>" : "\<End>"]]):with_noremap():with_expr(),
  -- visual
  ["v|<C-r>"]             = map_cmd('"hy:%s/<C-r>h//gc<left><left><left>'):with_noremap(),
  -- command line
  ["c|<C-a>"]             = map_cmd('<Home>'):with_noremap(),
  ["c|<C-e>"]             = map_cmd('<End>'):with_noremap(),
  ["c|<C-d>"]             = map_cmd('<Del>'):with_noremap(),
  ["c|<C-h>"]             = map_cmd('<BS>'):with_noremap(),
  ["c|<C-t>"]             = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
}

bind.nvim_load_mapping(def_map)
