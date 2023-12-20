function! asyncomplete#sources#tags#get_source_options(opts)
	return extend({}, a:opts)
endfunction


function! asyncomplete#sources#tags#completor(opt, ctx)
	let l:asyncomplete_tags_fuzzymatch = get(g:, 'asyncomplete_tags_fuzzymatch', 0)

	let l:keyword = matchstr(a:ctx['typed'], '\m\k\+$')
	if strlen(l:keyword) == 0
		call asyncomplete#complete(a:opt['name'], a:ctx, a:ctx['col'] - strlen(l:keyword), [])
		return
	endif

	if l:asyncomplete_tags_fuzzymatch
		let l:tags = taglist('\m.\+', expand('%:p'))->map({_, val -> val['name']})
		let l:matches = matchfuzzy(l:tags, l:keyword)
	else
		let l:matches = getcompletion(l:keyword, 'tag')
	endif
	call asyncomplete#complete(a:opt['name'], a:ctx, a:ctx['col'] - strlen(l:keyword), l:matches)
endfunction
