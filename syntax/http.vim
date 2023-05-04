" Vim syntax file
" Language:         HTTP header file
" Maintainer:       Ilya Kolesnikovich <ravishankar@mail.ru>
" Latest Revision:  2007-12-06

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn match   httpMethod      "^\(OPTIONS\|GET\|HEAD\|POST\|PUT\|DELETE\|TRACE\|CONNECT\) .*$"
                            \ contains=httpLinkDelimiter,httpLinkSpecial,escaped
syn match   httpResponse    "^HTTP/.*$"
syn match   httpHeader      "^[a-zA-Z0-9\-]*:"me=e-1
syn region  httpString      start=+"+ skip=+\\$+ end=+"\|$+
                            \ contains=httpLink
syn match   httpLinkDelimiter   '[\?&]'
syn match   httpLinkSpecial     '='
syn region  httpLink       start=+\(http\|https\|ftp\)://+ skip=+[/?&=\.\-%\*,]+ end=+\(\>\|$\)+
                            \ contains=httpLinkDelimiter,httpLinkSpecial,escaped
syn match   tspecials       '[()<>@,;:\\\+/\[\]\?={}]'
syn match   escaped         '%[0-9]\{2\}'
"SP  HT

hi def link httpMethod          Type
hi def link httpResponse        Type
hi def link httpHeader          Keyword
hi def link httpString          String
hi def link tspecials           SpecialChar
hi def link httpLinkSpecial     SpecialChar
hi def link escaped             SpecialChar
hi def link httpLinkDelimiter   Delimiter
hi def link httpLink            Identifier

let b:current_syntax = "http"

let &cpo = s:cpo_save
unlet s:cpo_save

