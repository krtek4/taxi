" Vim syntax file
" Language:	Taxi
" Maintainer:	Gilles Meier <gilles.meier@liip.ch>
" Last Change:  2013 Mar 14 by Gilles Meier

if exists("b:current_syntax") 
	finish
endif

let s:cpo_save = &cpo
set cpo&vim

" match day
syn match   taxiDay	    "^[0-9]\+\/[0-9]\+\/[0-9]\+"

" match alias
syn match   taxiAlias   "^[a-zA-z]\+"

" match hours
syn match   taxiHours   "\s\+[0-9]\+:*[0-9]\+-[0-9]\+:*[0-9]\+"
syn match   taxiHours   "\s\+-[0-9]\+:*[0-9]\+"

" match comment
syn match   taxiDesc	"\s\+\S\+$"

" match sent
syn match   taxiSent    "^#.*"


" Define the default highlighting.
hi def link	taxiDay		Special	
hi def link	taxiAlias	Underlined
hi def link	taxiHours	Type	
hi def link	taxiDesc	Statement
hi def link taxiSent	Comment	

let b:current_syntax = "taxi"

let &cpo = s:cpo_save
unlet s:cpo_save
