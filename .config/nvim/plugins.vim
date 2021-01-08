
""" Vim-Plug
call plug#begin()

Plug 'fatih/vim-go'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'kristijanhusak/completion-tags'
"Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Debuggers
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

"Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'shougo/neocomplete.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'kyazdani42/nvim-web-devicons' " for file icons
"Plug 'kyazdani42/nvim-tree.lua'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mbbill/undotree'
Plug 'Lokaltog/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim'

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

