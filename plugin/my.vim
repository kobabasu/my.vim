" Vim global plugin for preview current file in browser
" Last Change:	2012 Feb 07
" Maintainer:	Keiji Kobayashi <keiji@seeknetusa.com>
" License:	This file is placed in the public domain.


""" open project
nmap <C-w>p     :vi! $HOME/projects/project/index.html<Cr>:vert h logs_training<Cr>:vnew<Cr>:e $HOME/projects/project<Cr>

""" resize window
nmap <C-w>3    :set co=240<Cr><C-w>t24<C-w><bar><C-w>w60<C-w><bar>
nmap <C-w>4    :set co=240<Cr><C-w>t24<C-w><bar><C-w>w60<C-w><bar><C-w>w60<C-w><bar><C-w>w

""" preview browser
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
