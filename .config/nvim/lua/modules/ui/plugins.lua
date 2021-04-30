local ui = {}
local conf = require('modules.ui.config')

ui['glepnir/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}
ui[ 'tjdevries/gruvbuddy.nvim'] = {
  --config = [[require('colorbuddy').colorscheme('gruvbuddy')]],
  requires='tjdevries/colorbuddy.vim'
}
ui['marko-cerovac/material.nvim'] = {
  --config = [[require('material').set()]]
}
ui['sainnhe/sonokai'] = {}
ui['jsit/toast.vim'] = {}
ui['gruvbox-community/gruvbox'] = {
 --config = [[vim.cmd('colorscheme gruvbox')]]
}

ui['folke/which-key.nvim'] = {
  config = conf.which_key
}

ui['glepnir/dashboard-nvim'] = {
  config = conf.dashboard
}

ui['glepnir/galaxyline.nvim'] = {
  branch = 'main',
  config = conf.galaxyline,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['glepnir/indent-guides.nvim'] = {
  event = 'BufRead',
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf._gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

return ui
