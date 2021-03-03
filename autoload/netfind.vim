function! netfind#resolve(path)
	py3 import vim_netfind
	return py3eval('vim_netfind.resolve(vim_netfind.vim.eval("a:path"))')
endfunction

function! netfind#resolve_at(base, path)
	py3 import vim_netfind
	return py3eval('vim_netfind.resolve(vim_netfind.vim.eval("a:path"), base=vim_netfind.vim.eval("a:base"))')
endfunction

function! netfind#find(path)
	exe 'edit ' . fnameescape(netfind#resolve(a:path))
endfunction

let s:enabled = [
		\ '^http:\/',
		\ '^https:\/',
		\ '^gopher:\/',
		\ '^gemini:\/',
		\ ]

function! netfind#enabled_matches(path)
	for l:ptn in s:enabled
		if match(a:path, l:ptn) >= 0
			return v:true
		endif
	endfor
	return v:false
endfunction

function! netfind#enabled_addptn(ptn)
	if index(s:enabled, a:ptn) < 0
		call add(s:enabled, a:ptn)
	endif
endfunction

function! netfind#enabled_delptn(ptn)
	let l:idx = index(s:enabled, a:ptn)
	if l:idx < 0
		return
	endif
	call remove(s:enabled, a:ptn)
endfunction

function! netfind#_enabled_getlist()
	return s:enabled
endfunction

function! netfind#_getsel()
	let l:save = @a
	norm! gv"ay
	let l:res = @a
	let @a = l:save
	return l:res
endfunction
