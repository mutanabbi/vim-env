" Vim syntax file
" Language:         Packet file
" Maintainer:       Ilya Kolesnikovich <ravishankar@mail.ru>
" Latest Revision:  2007-12-07

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   packetSpecialSymbol        '[=:]'
syn region  packetVarName              keepend contained oneline start=+^\(hdr\|data\):\(int\|str\):+ end=+=+ contains=packetDestinition,packetType,packetSpecialSymbol
syn region  packetVarName              keepend contained oneline start=+^qs:+ end=+=+ contains=packetDestinition,packetType,packetSpecialSymbol
syn match   packetIForgetWord          '\(-SPKT-\|-EPKT-\)'
syn keyword packetDestinition          contained hdr qs data
syn keyword packetType                 contained display int str
syn keyword packetPredefineHdrVarName  account packet_type dst_host packet_format
syn keyword packetPredefineHdrVarName  packet_index timestamp_sec timestamp_usec
syn region  packetString               oneline start=+^+ end=+$+ contains=packetVarName,packetIForgetWord

hi def link packetIForgetWord          Delimiter
hi def link packetDestinition          Keyword
hi def link packetType                 Type
hi def link packetPredefineHdrVarName  Identifier
hi def link packetVarName              Identifier
hi def link packetSpecialSymbol        Delimiter

syn region myFold start="-SPKT-"rs=e+1,me=e+1 end="-EPKT-"re=s-1,me=s-1 transparent fold keepend

let b:current_syntax = "pkt"

let &cpo = s:cpo_save
unlet s:cpo_save
