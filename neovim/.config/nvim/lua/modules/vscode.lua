-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()
require 'packer'.init({
  max_jobs = 50
})

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    after = 'telescope.nvim',
    config = require('modules.treesitter').setup,
    run = ':TSUpdate',
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use 'kyazdani42/nvim-web-devicons'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'tami5/sqlite.lua' },
      { 'zane-/cder.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
    },
    config = require('modules.ui.telescope').setup,
  }

  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'asdfghjkl' }
    end
  }
end)
