
""" Vim-Plug
call plug#begin()

Plug 'fatih/vim-go'

Plug 'mfussenegger/nvim-dap'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
"Plug 'kristijanhusak/completion-tags'
"Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
"Plug 'tjdevries/nlua.nvim'
"Plug 'tjdevries/lsp_extensions.nvim'

" Debuggers
Plug 'puremourning/vimspector'
Plug 'nvim-telescope/telescope-vimspector.nvim'
Plug 'szw/vim-maximizer'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" Snipets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
"Plug 'kyazdani42/nvim-tree.lua'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
"Plug 'bling/vim-arline'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'tpope/vim-fugitive'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mbbill/undotree'
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
Plug 'Lokaltog/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdcommenter'
Plug 'szw/vim-maximizer'
Plug 'junegunn/vim-peekaboo'
Plug 'Yilin-Yang/vim-markbar'
Plug 'akinsho/nvim-bufferline.lua'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-git'
Plug 'motemen/git-vim'
"Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
"Plug 'kdheepak/lazygit.nvim'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

Plug 'kosayoda/nvim-lightbulb'

Plug 'ekalinin/Dockerfile.vim'
"Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-gfm-syntax'
Plug 'MTDL9/vim-log-highlighting'
"Plug 'Shougo/defx.nvim'
Plug 'reedes/vim-wordy'
Plug 'brooth/far.vim'
Plug 'Shougo/deorise.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mzlogin/vim-markdown-toc'
Plug 'sheerun/vim-polyglot'

"Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'kristijanhusak/vim-hybrid-material'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

Plug 'stephpy/vim-yaml'
Plug 'Yggdroot/indentLine'

Plug 'voldikss/vim-floaterm'

"Plug 'kyazdani42/nvim-web-devicons'
"Plug 'romgrk/barbar.nvim'

" InfluxDB
"Plug 'mattn/webapi-vim'
"Plug 'gianarb/vim-flux'

call plug#end()

