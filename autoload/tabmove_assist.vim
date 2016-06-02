" File: autoload/tabmove_assist.vim
" Author: Toru Hoyano <toru.iwashita@gmail.com>
" License: MIT License

let s:cpo_save = &cpo
set cpo&vim

if !exists('g:tabmove_assist_after_shift')
  let g:tabmove_assist_after_shift = 'zz'
endif

function! s:after_shift()
  let action = g:tabmove_assist_after_shift

  if match(action, 'zt') != -1
    return 'zt'
  elseif match(action, 'zb') != -1
    return 'zb'
  else
    return 'zz'
  endif
endfunction

function! tabmove_assist#shift()
  if winnr('$') == 1
    return 0
  endif

  let current_line_num = line('.')

  tabedit %
  tabp | hide | tabn
  execute current_line_num
  execute 'normal! '.s:after_shift() 
endfunction

function! tabmove_assist#move(num)
  let current_tab_num = tabpagenr()

  if a:num < current_tab_num
    let dist_tab_num = a:num - 1
  else
    let dist_tab_num = a:num
  end
  execute 'tabmove '.dist_tab_num
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
