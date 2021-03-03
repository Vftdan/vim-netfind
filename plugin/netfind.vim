command! -nargs=1 Nfind call netfind#find(<f-args>)

map <expr> <Plug>(netfind-gf) netfind#enabled_matches(@%) ? "\<Plug>(netfind-gf-force)" : "\<Plug>(netfind-gf-native)"
map <expr> <Plug>(netfind-c-wf) netfind#enabled_matches(@%) ? "\<Plug>(netfind-c-wf-force)" : "\<Plug>(netfind-c-wf-native)"
map <expr> <Plug>(netfind-c-wgf) netfind#enabled_matches(@%) ? "\<Plug>(netfind-c-wgf-force)" : "\<Plug>(netfind-c-wgf-native)"
ounmap <Plug>(netfind-gf)
ounmap <Plug>(netfind-c-wf)
ounmap <Plug>(netfind-c-wgf)

noremap <Plug>(netfind-gf-native) gf
noremap <Plug>(netfind-c-wf-native) <C-W>f
noremap <Plug>(netfind-c-wgf-native) <C-W>gf

nnoremap <Plug>(netfind-gf-force) <cmd>call netfind#find(expand('<lt>cfile>'))<cr>
vnoremap <Plug>(netfind-gf-force) <esc><cmd>call netfind#find(netfind#_getsel())<cr>
nnoremap <Plug>(netfind-c-wf-force) :split <c-r>=fnameescape(netfind#resolve(expand('<lt>cfile>')))<cr><cr>
nnoremap <Plug>(netfind-c-wgf-force) :tab split <c-r>=fnameescape(netfind#resolve(expand('<lt>cfile>')))<cr><cr>
" Just in case:
vnoremap <Plug>(netfind-c-wf-force) <esc>:split <c-r>=fnameescape(netfind#resolve(netfind#_getsel()))<cr><cr>
vnoremap <Plug>(netfind-c-wgf-force) <esc>:tab split <c-r>=fnameescape(netfind#resolve(netfind#_getsel()))<cr><cr>

if !(has('g:netfind_nomaps') && g:netfind_nomaps)
	nmap gf <Plug>(netfind-gf)
	vmap gf <Plug>(netfind-gf)
	nmap <c-w>f <Plug>(netfind-c-wf)
	nmap <c-w>gf <Plug>(netfind-c-wgf)
endif
