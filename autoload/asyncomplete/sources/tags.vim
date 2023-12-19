function! asyncomplete#sources#tags#get_source_options(opts)
	return extend({}, a:opts)
endfunction


function! asyncomplete#sources#tags#completor(opt, ctx)
	let l:keyword = matchstr(a:ctx['typed'], '\m\k\+$')
	if strlen(l:keyword) == 0
		call asyncomplete#complete(a:opt['name'], a:ctx, a:ctx['col'] - strlen(l:keyword), [])
		return
	endif

	let l:matches = getcompletion(l:keyword, 'tag')
	call asyncomplete#complete(a:opt['name'], a:ctx, a:ctx['col'] - strlen(l:keyword), l:matches)
endfunction
