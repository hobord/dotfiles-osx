
source $HOME/.config/nvim/plugins.vim
let mapleader=" "
syntax on
filetype plugin indent on

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hidden

set number
"set relativenumber
set signcolumn=yes
"set cuc
 
set mouse=a
set cursorline
set scrolloff=999
set encoding=utf-8
set splitbelow
set splitright
set clipboard=unnamedplus
 
set undodir=/tmp
set backupdir=~/backup
 
colorscheme gruvbox
set background=dark
"let g:solarized_termcolors = 256  " New line!!
set guifont=Fira\ Code
 
 
" fix scroll black background issue
set t_ut=
 
" Flash screen instead of beep sound
" 
" 
set visualbell
" Set the encoding of files written
set fileencoding=utf-8
set backspace=indent,eol,start
 
" higlight search
:noremap <F4> :set hlsearch! hlsearch?<CR>
"lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})
 
" find in subdirectories
set path+=**
" Display all found files in tabs
"set wildmenu
" 
 
"map <M-Left> :bp<CR> 
"map <M-Right> :bn<CR>
map <C-PageUp> :bp<CR> 
map <C-PageDown> :bn<CR>
map <C-S-left> <C-w>h  
map <C-S-down> <C-w><down>
map <C-S-up> <C-w><up>
map <C-S-right> <C-w>l
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-t>n :tabnew<cr>
map <leader>tc :tabclose<cr>
map <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>

"inoremap <C-l> <C-o>w
"noremap <C-h> <C-o>b

" Copy/Paste ctrl+c / ctrl+v
map <C-c> "cy
nnoremap <C-v> "cP`]

" Close Buffer + keep window 
command! BW :bn|:bd#

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"nnoremap <C-t> :FloatermToggle<CR>
"let g:floaterm_autoinsert=0
"nnoremap <M-b> :Vista finder<CR>
"nnoremap <C-B> :Vista!!<CR>
"nnoremap <C-f> :Files<CR>
nnoremap <leader>r :Rg<CR>
"nnoremap <M-g> :LazyGit<CR>
"nnoremap <C-b> :TagbarToggle<CR>
nnoremap <C-h> :UndotreeToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>
command! LF FloatermNew lf
command! Vifm FloatermNew vifm
command! Lgit FloatermNew lazygit
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>lua require'telescope.builtin'.lsp_references{}<cr>
nnoremap <leader>fs <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<cr>

" Markbar
" only display alphabetic marks a-i and A-I
let g:markbar_marks_to_display = 'abcdefghiABCDEFGHI'
" width of a vertical split markbar
let g:markbar_width = 80
let g:markbar_peekaboo_width = 80
" indentation for lines of context
let g:markbar_context_indent_block = '  '
" number of lines of context to retrieve per mark
let g:markbar_num_lines_context = 3
" markbar-local mappings
let g:markbar_jump_to_mark_mapping  = '<CR>'
let g:markbar_next_mark_mapping     = 'n'
let g:markbar_previous_mark_mapping = 'N'
let g:markbar_rename_mark_mapping   = '<F2>'
let g:markbar_reset_mark_mapping    = 'r'
let g:markbar_delete_mark_mapping   = '<Del>'
" open/close markbar mappings
nmap <Leader>m  <Plug>ToggleMarkbar
nmap <Leader>mo <Plug>OpenMarkbar
nmap <Leader>mc <Plug>CloseMarkbar

source $HOME/.config/nvim/golang.vim
source $HOME/.config/nvim/php.vim

" autocompletion
"let g:deoplete#enable_at_startup = 1
set completeopt=menu,menuone,noselect
set shortmess+=c
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"autocmd BufEnter * lua require'compe'.on_attach()
"autocmd BufEnter * lua require'completion'.on_attach()
"" Or combine with lsp
"let g:completion_chain_complete_list = {
      "\ 'default': [
      "\    {'complete_items': ['lsp', 'tags']},
      "\  ]}


let g:compe = {}
let g:compe.enabled = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable' || 'disable' || 'always'
let g:compe.allow_prefix_unmatch = v:false
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.nvim_lsp = v:true

"let g:vsnip_snippet_dir=
let g:vsnip_snippet_dirs = ['~/.config/nvim/snippets']

let g:vsnip_filetypes = {}
"let g:vsnip_filetypes.javascriptreact = ['javascript']
"let g:vsnip_filetypes.typescriptreact = ['typescript']

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

let g:vimspector_enable_mappings = 'HUMAN'



" vim-airline
set laststatus=2
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'



"lua require("lsp_config")
"    root_dir = lspconfig.util.root_pattern('.git', '.mod');
nnoremap <silent> <F2> :lua vim.lsp.buf.rename()<CR>
command! Rename lua vim.lsp.buf.rename()
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1



nnoremap <leader>vdc :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vtd :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vds :lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>vws: lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
"nnoremap <leader>m :Maximizeruoggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

autocmd BufRead,BufNewFile *.flux set filetype=flux
if executable('flux-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'flux lsp',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'flux-lsp']},
        \ 'whitelist': ['flux'],
        \ })
endif
autocmd FileType flux nmap gd <plug>(lsp-definition)

" foldmethod=syntax
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 foldmethod=indent
autocmd Filetype python setlocal foldmethod=indent
"omnifunc=pythoncomplete#Complete
let g:indentLine_char = '⦙'
let g:indentLine_enabled = 0
" :IndentLinesToggle

" NERDTree plugin specific commands
:nnoremap <C-g> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeNaturalSort=1
let NERDTreeShowBookmarks=1
let NERDTreeCascadeOpenSingleChildDir=1
" autocmd vimenter * NERDTree


" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Easy motion
"
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {
                \     "\<CR>": '<Over>(easymotion)'
                \   },
                \   'is_expr': 0
                \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" LuaTree plugin
"let g:lua_tree_icons = {
"    \ 'default': '',
"    \ 'symlink': '',
"    \ 'git': {
"    \   'unstaged': "✗",
"    \   'staged': "✓",
"    \   'unmerged': "",
"    \   'renamed': "➜",
"    \   'untracked': "★"
"    \   },
"    \ 'folder': {
"    \   'default': "",
"    \   'open': "",
"    \   'symlink': "",
"    \   }
"    \ }

"nnoremap <C-n> :LuaTreeToggle<CR>
"nnoremap <leader>r :LuaTreeRefresh<CR>
"nnoremap <leader>n :LuaTreeFindFile<CR>
" LuaTreeOpen and LuaTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help lua_tree_highlight`
"highlight LuaTreeFolderIcon guibg=blue

" Minimap color
hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f
let g:minimap_highlight = 'MinimapCurrentLine'
