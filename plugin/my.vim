" Vim global plugin for preview current file in browser
" Last Change:	2012 Feb 07
" Maintainer:	Keiji Kobayashi <keiji@seeknetusa.com>
" License:	This file is placed in the public domain.

""" open project
nmap <C-w>p     :vi! $HOME/projects/project/index.html<Cr>:vert h logs_training<Cr>:vnew<Cr>:e $HOME/projects/project<Cr>

""" resize window
nmap <C-w>2    <C-w>t24<C-w><bar>
nmap <C-w>3    :set co=240<Cr><C-w>t24<C-w><bar><C-w>w60<C-w><bar>
nmap <C-w>4    :set co=240<Cr><C-w>t24<C-w><bar><C-w>w60<C-w><bar><C-w>w60<C-w><bar><C-w>w

""" AllMaps
command!
\   -nargs=* -complete=mapping
\   AllMaps
\   map <args> | map! <args> | lmap <args>

""" reload .vimrc 
nnoremap <Space>s.  :<C-u>source $HOME/.vimrc<Return>

""" zencording
let g:user_zen_settings = {
      \ 'indentation' : '  ',
      \ 'javascript'  : {
      \ 'snippets'    : {
      \ 'jq'          : "${function() {\n\t${cursor}${child}\n};",
      \ 'jq:each'     : "$.each(${cursor}, function(index,item)\n\t${child}\n});",
      \ 'fn'          : "(function() {\n\t${cursor}\n});",
      \ 'tm'          : "setTimeout(function() {\n\t${cursor}\n}, 100);",
      \ },
      \ },
      \ }

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

""" commentout.vim
" lhs comments
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" block comments
vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>
