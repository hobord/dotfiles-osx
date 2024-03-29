local vim = vim
local map = vim.keymap.set

vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', ' ', '', { noremap = true })
vim.api.nvim_set_keymap('x', ' ', '', { noremap = true })

cmd = function(str)
  return "<cmd>" .. str .. "<cr>"
end

map('n', '<C-q>', cmd('wq'), { noremap = true, silent = true, desc = 'Save and quit' })
map('n', '<C-c>', cmd('Bdelete'), { noremap = true, silent = true, desc = 'Close buffer' })
map('n', '<M-q>', cmd('qall!'), { noremap = true, silent = true, desc = 'Quit all' })
map('n', '<C-s>', cmd('write'), { noremap = true, silent = true, desc = 'Save' })

map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = 'Left window' })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = 'Right window' })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = 'Down window' })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = 'Up window' })

map('n', '<C-PageUp>', cmd('bp'), { noremap = true, silent = true, desc = 'Previous buffer' })
map('n', '<C-PageDown>', cmd('bn'), { noremap = true, silent = true, desc = 'Next buffer' })
-- map('n', '<C-S-PageUp>', cmd('BufferLineMovePrev'), { noremap = true, silent = true, desc = 'Move buffer left' })
-- map('n', '<C-S-PageDown>', cmd('BufferLineMoveNext'), { noremap = true, silent = true, desc = 'Move buffer right' })

map('n', '<C-t>j', cmd('tabp'), { noremap = true, silent = true, desc = 'Previous tab' })
map('n', '<C-t>k', cmd('tabn'), { noremap = true, silent = true, desc = 'Next tab' })
map('n', '<C-t>n', cmd('tab split'), { noremap = true, silent = true, desc = 'New tab' })
map('n', '<C-t>c', cmd('tabclose'), { noremap = true, silent = true, desc = 'Close tab' })

map('n', '<A-[>', cmd('vertical resize -5'), { noremap = true, silent = true, desc = 'Decrease window' })
map('n', '<A-]>', cmd('vertical resize +5'), { noremap = true, silent = true, desc = 'Increase window' })

map('n', 'zi', 'zi:let &l:fdc=&l:fen*&g:fdc<CR>', { noremap = true, silent = true, desc = 'Toggle fold' })
map('n', 'Y', 'y$', { noremap = true, silent = true })
map('n', 'yY', '^y$', { noremap = true, silent = true })

map('n', '<Leader>n', cmd('noh'), { noremap = true, silent = true, desc = 'Clear search highlight' })
map('n', '<Leader><Leader>r', cmd('set relativenumber!'),
  { noremap = true, silent = true, desc = 'Toggle relative number' })
map('n', '<Leader><Leader>w', cmd('set wrap!'), { noremap = true, silent = true, desc = 'Toggle wrap' })

map('i', '<C-u>', '<C-O>u', { noremap = true, silent = true, desc = 'Undo' })
map('i', '<C-j>', '<Esc>o', { noremap = true, silent = true, desc = 'New line below' })
map('i', '<C-k>', '<Esc>O', { noremap = true, silent = true, desc = 'New line above' })
map('i', '<C-s>', cmd('w'), { noremap = true, silent = true, desc = 'Save' })
map('i', '<C-q>', cmd('wq'), { noremap = true, silent = true, desc = 'Save and quit' })

map('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>', { noremap = true })

map('c', '<C-a>', '<Home>', { noremap = true })
map('c', '<C-e>', '<End>', { noremap = true })
map('c', '<C-d>', '<Del>', { noremap = true })
map('c', '<C-h>', '<BS>', { noremap = true })
map('c', '<C-t>', [[<C-R>=expand("%:p:h") . "/" <CR>]], { noremap = true })

map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
-- map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
-- map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
-- map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- map('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
