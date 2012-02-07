" Vim global plugin for preview current file in browser
" Last Change:	2012 Feb 07
" Maintainer:	Keiji Kobayashi <keiji@seeknetusa.com>
" License:	This file is placed in the public domain.

if has('mac')
 nnoremap <C-l>c :! open -a Google\ Chrome %<Return>
 nnoremap <C-l>f :! open -a Firefox %<Return>
 nnoremap <C-l>s :! open -a Safari %<Return>
elseif has('win32')
 nnoremap <C-l>c :! start chrome.exe %<Return>
 nnoremap <C-l>f :! start firefox.exe %<Return>
 nnoremap <C-l>s :! start Safari.exe %<Return>
 nnoremap <C-l>i :! start IEXPLORE.EXE %<Return>
else
 nnoremap <C-l>c :! open -a chronium %<Return>
 nnoremap <C-l>f :! open -a firfox %<Return>
endif
