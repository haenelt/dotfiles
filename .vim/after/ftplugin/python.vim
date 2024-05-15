" tab configuration
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal colorcolumn=88

" linter configuration
let g:ale_linters = {
    \ 'python': ['flake8', 'mypy']
    \ }
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['black', 'isort']
    \ }
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_python_mypy_options = '--ignore-missing-imports=True'
let g:ale_fix_on_save = 1 " set this variable to 1 to fix files when you save them
