
" PHP LSP
lua << EOF
require'lspconfig'.intelephense.setup{
    on_attach=require'compe'.on_attach
} 

