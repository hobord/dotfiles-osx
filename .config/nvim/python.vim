autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 foldmethod=indent
autocmd Filetype python setlocal foldmethod=indent

lua << EOF
require'lspconfig'.pyls.setup{}
EOF

