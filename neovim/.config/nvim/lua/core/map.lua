local vim = vim
local map = vim.keymap.set

vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', ' ', '', { noremap = true })
vim.api.nvim_set_keymap('x', ' ', '', { noremap = true })

cmd = function(str)
  return "<cmd>" .. str .. "<cr>"
end

map('n', '<C-q>', cmd('wq'), { noremap = true, silent = true })
map('n', '<C-c>', cmd('q!'), { noremap = true, silent = true })
map('n', '<M-q>', cmd('qall!'), { noremap = true, silent = true })
map('n', '<C-s>', cmd('write'), { noremap = true, silent = true })

map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })

map('n', '<C-PageUp>', cmd('bp'), { noremap = true, silent = true })
map('n', '<C-PageDown>', cmd('bn'), { noremap = true, silent = true })
map('n', ']b', cmd('bp'), { noremap = true, silent = true })
map('n', '[b', cmd('bn'), { noremap = true, silent = true })
map('n', '<C-S-PageUp>', cmd('BufferLineMovePrev'), { noremap = true, silent = true })
map('n', '<C-S-PageDown>', cmd('BufferLineMoveNext'), { noremap = true, silent = true })

map('n', '<C-t>j', cmd('tabp'), { noremap = true, silent = true, desc = 'Go to previous tab' })
map('n', '<C-t>k', cmd('tabn'), { noremap = true, silent = true, desc = 'Go to next tab' })
map('n', '<C-t>n', cmd('tab split'), { noremap = true, silent = true, desc = 'New tab' })
map('n', '<C-t>c', cmd('tabclose'), { noremap = true, silent = true, desc = 'Close tab' })

map('n', '<A-[>', cmd('vertical resize -5'), { noremap = true, silent = true })
map('n', '<A-]>', cmd('vertical resize +5'), { noremap = true, silent = true })

map('n', 'zi','zi:let &l:fdc=&l:fen*&g:fdc<CR>', { noremap = true, silent = true })
map('n', 'Y', 'y$', { noremap = true, silent = true })

map('n', '<Leader>m', cmd('noh'), { noremap = true, silent = true, desc = 'Clear search highlight' })
map('n', '<Leader><Leader>r', cmd('set relativenumber!'), { noremap = true, silent = true, desc = 'Toggle relative number' })
map('n', '<Leader><Leader>w', cmd('set wrap!'), { noremap = true, silent = true, desc = 'Toggle wrap' })

map('i', '<C-u>', '<C-O>u', { noremap = true, silent = true })
map('i', '<C-j>', '<Esc>o', { noremap = true, silent = true })
map('i', '<C-k>', '<Esc>O', { noremap = true, silent = true })
map('i', '<C-s>', cmd('w'), { noremap = true, silent = true })
map('i', '<C-q>', cmd('wq'), { noremap = true, silent = true })

map('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>', { noremap = true })

map('c', '<C-a>', '<Home>', { noremap = true })
map('c', '<C-e>', '<End>', { noremap = true })
map('c', '<C-d>', '<Del>', { noremap = true })
map('c', '<C-h>', '<BS>', { noremap = true })
map('c', '<C-t>', [[<C-R>=expand("%:p:h") . "/" <CR>]], { noremap = true })

