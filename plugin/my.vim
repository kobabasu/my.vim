" Vim global plugin for preview current file in browser
" Last Change:	2012 Feb 07
" Maintainer:	Keiji Kobayashi <keiji@seeknetusa.com>
" License:	This file is placed in the public domain.

""" tabline
function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let buflen = tabpagewinnr(a:n, '$')
  let bufnum = bufnr(buflist[winnr - 1])
  let bufname = fnamemodify(bufname(buflist[winnr - 1]), ':t')
  let modi = len(filter(copy(buflist), 'getbufvar(v:val, "&modified")')) ? ' +' : ''
  let label = ' ' . a:n . ': '
  let label .= bufname == '' ? 'new' : bufname
  let label .= modi . ''
  let label .= ' ' . bufnum . ' '

  return label
endfunction

function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i + 1) . 'T'
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  return s
endfunction
set tabline=%!MyTabLine()

""" AllMaps
command!
\   -nargs=* -complete=mapping
\   AllMaps
\   map <args> | map! <args> | lmap <args>

""" vertical help
noremap <C-h> :vert bel h 

""" esc nohl
nmap <Esc><Esc> :nohlsearch<CR><Esc>

""" insert blank line
nnoremap _ :<C-u>call append(expand('.'), '')<Cr>j

""" resize window
nmap <C-w>0 :set co=64<Cr>:winpos 1100 40<Cr>
nmap <C-w>2 <C-w>t24<C-w><bar><C-w>b
nmap <C-w>3 :set co=240<Cr><C-w>t24<C-w><bar><C-w>w60<C-w><bar><C-w>b
nmap <C-w>4 :set co=240<Cr><C-w>t24<C-w><bar><C-w>w60<C-w><bar><C-w>w60<C-w><bar><C-w>b
nmap <C-w>5 :set co=240<Cr>24<C-w><bar><C-w>l50<C-w><bar><C-w>l50<C-w><bar><C-w>l60<C-w><bar><C-w>l<C-w>t

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

" coffeescript
nmap <C-c> :w<CR>:! coffee %<CR>

" today
let $today = strftime('%Y%m%d')
let $todaytime = strftime('%Y%m%d.%H%M%S')
