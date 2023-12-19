asyncomplete-tags.vim
=====================

Tag completion source for [asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim).

Uses *vim*'s builtin tag completion via `getcompletion()`.

*asyncomplete-tags.vim* does not generate tag files. Another plugin such as [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags) is required for this.


Install
-------

With [vim-plug](https://github.com/junegunn/vim-plug):

```
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'notuxic/asyncomplete-tags.vim'
```


Register
--------

The completion source also needs to be registered to be used by [asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim):

```
call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
\ 'name': 'tags',
\ 'allowlist': ['*'],
\ 'completor': function('asyncomplete#sources#tags#completor')
\ }))
```

