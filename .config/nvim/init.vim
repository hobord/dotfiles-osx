
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
set relativenumber
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
 
map <M-Left> :bp<CR> 
map <M-Right> :bn<CR>
map <C-left> <C-w><C-h>
map <C-down> <C-w><C-j>
map <C-up> <C-w><C-k>
map <C-right> <C-w><C-l>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-t>n :tabnew<cr>

" Copy/Paste ctrl+c / ctrl+v
map <C-c> "cy
nnoremap <C-v> "cP`]

"nnoremap <C-t> :FloatermToggle<CR>
"let g:floaterm_autoinsert=0
nnoremap <M-b> :Vista finder<CR>
"nnoremap <C-B> :Vista!!<CR>
nnoremap <C-f> :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <M-g> :LazyGit<CR>
"nnoremap <C-b> :TagbarToggle<CR>
nnoremap <C-h> :UndotreeToggle<CR>

command! LF FloatermNew lf
command! Vifm FloatermNew vifm
"command! Lgit FloatermNew lazygit

" autocompletion
"let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
lua require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
autocmd BufEnter * lua require'completion'.on_attach()
set completeopt=menuone,noinsert,noselect
set shortmess+=c
" Or combine with lsp
let g:completion_chain_complete_list = {
      \ 'default': [
      \    {'complete_items': ['lsp', 'tags']},
      \  ]}


" vim go
" disable open browser after posting snippet
let g:go_play_open_browser = 0
" enable goimports
let g:go_gpls_enabled = 1
let g:go_fmt_command = "goimports"
let g:go_imports_mode = "gopls"
let g:go_imports_autosave = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0

" enable additional highlighting

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
" Deugger
nnoremap <F5> :GoDebugStart<CR>
nnoremap <F8> :GoDebugContinue<CR>
nnoremap <F9> :GoDebugBreakpoint<CR>
nnoremap <F10> :GoDebugNext<CR>

" vim-airline
set laststatus=2
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'

" tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Status line types/signatures.
let g:go_auto_type_info = 1


"lua require("lsp_config")
"    root_dir = lspconfig.util.root_pattern('.git', '.mod');
lua << EOF
require'lspconfig'.gopls.setup{
}
EOF
set completeopt=menuone,noinsert,noselect
nnoremap <silent> <F2> :lua vim.lsp.buf.rename()<CR>
command! Rename lua vim.lsp.buf.rename()
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1


"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
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


autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 omnifunc=v:lua.vim.lsp.omnifunc
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


