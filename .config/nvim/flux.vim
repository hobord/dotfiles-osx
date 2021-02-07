autocmd BufRead,BufNewFile *.flux set filetype=flux
if executable('flux-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'flux lsp',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'flux-lsp']},
        \ 'whitelist': ['flux'],
        \ })
endif
autocmd FileType flux nmap gd <plug>(lsp-definition)

