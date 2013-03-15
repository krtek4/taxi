" Vim syntax file
" Language: Taxi
" Maintainer: Gilles Meier <gilles.meier@liip.ch>
" Last Change:  2013 Mar 14 by Gilles Meier

if exists("b:current_syntax") 
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" match day
syn match   taxiDay     "^\d\+\/\d\+\/\d\+"

" match description
syn match   taxiDesc  ".\+$" contained

" match hours
syn match   taxiCompleteHours     "\d\+:*\d\+-\d\+:*\d\+" contained nextgroup=taxiDesc skipwhite
syn match   taxiCompleteHours     "-\d\+:*\d\+" contained nextgroup=taxiDesc skipwhite

syn match   taxiIncompleteHours   "\d\+:*\d\+-?" nextgroup=taxiDesc skipwhite
syn match   taxiIncompleteHours   "-?" nextgroup=taxiDesc skipwhite

" match sent
syn match   taxiSent    "^#.*"

" match a line
syn match taxiLine  "^[a-zA-z_]\+" nextgroup=taxiCompleteHours skipwhite

" Define the default highlighting.
hi def link    taxiDay                 Special
hi def link    taxiLine                Type
hi def link    taxiCompleteHours       Todo
hi def link    taxiIncompleteHours     Underlined
hi def link    taxiDesc                Statement
hi def link    taxiSent                Comment  

let b:current_syntax = "taxi"

let &cpo = s:cpo_save
unlet s:cpo_save
