" tab configuration
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

" linter configuration
let g:ale_linters = {
    \ 'python': ['flake8', 'mypy']
    \ }
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['black', 'isort']
    \ }
let g:ale_fix_on_save = 1 " set this variable to 1 to fix files when you save them
