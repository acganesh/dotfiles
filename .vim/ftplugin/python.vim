set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

" Insert ipdb breakpoint.
" NOQA tells flake8 to ignore this statement.
:inoremap <Leader>d import ipdb; ipdb.set_trace()  # NOQA
