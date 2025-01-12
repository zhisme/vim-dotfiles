let g:ale_elixir_elixir_ls_release=expand("~/dev/elixir/elixir-ls/rel")

let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'ruby': ['brakeman', 'rubocop'],
  \ 'eruby': ['erblint'],
  \ 'rust': ['analyzer'],
  \ 'elixir': ['elixir-ls'],
  \ 'go': ['gofmt', 'gopls', 'go vet'],
  \ }
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'elixir': ['mix_format'],
 \ 'typescript': ['prettier'],
 \ 'typescriptreact': ['prettier'],
 \ 'json': ['prettier'],
 \ 'eruby': ['erblint'],
 \ 'ruby': ['rubocop']
 \ }
let g:ale_set_highlights = 0
let g:ale_ruby_rubocop_executable = 'bundle'
" let g:ale_linters_explicit = 1
