" Assist to move the tab
" Author:  ToruIwashita <toru.iwashita@gmail.com>
" License: This file is placed in the public domain.

if exists('g:loaded_tabmove_assist')
  finish
endif
let g:loaded_tabmove_assist = 1

let s:cpo_save = &cpo
set cpo&vim

function! tabmove_assist#shift()
  let l:target_buffer = bufnr('%')
  close
  silent! execute 'tabnew | buffer '.l:target_buffer
  unlet l:target_buffer
endfunction

function! tabmove_assist#move(num)
  let l:num = a:num - 1
  silent! execute 'tabmove '.l:num
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
