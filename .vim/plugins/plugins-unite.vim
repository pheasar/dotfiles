" --------------------------------------------------------------------
" Shougo/unite.vim
" --------------------------------------------------------------------

if dein#is_sourced('unite.vim')
  call unite#custom#profile('default', 'context', {
  \  'start_insert': 1,
  \  'ignorecase': 1,
  \  'smartcase': 1,
  \  'direction': 'belowright'
  \})
  
  " grep search
  nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
  " grep search in specified directory
  nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
  " grep search with a word on cursor
  nnoremap <silent> ,wg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
  " grep resume
  nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
  
  " open other files in the split window
  au FileType unite nnoremap <silent> <buffer> <expr> <CR> unite#do_action('split')
  au FileType unite inoremap <silent> <buffer> <expr> <CR> unite#do_action('split')
  
  " search using ag
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
  endif

  if dein#is_sourced('unite-outline')
    nnoremap <silent> ,o :<C-u>Unite -no-quit -vertical -winwidth=50 outline<CR>
  endif

endif

