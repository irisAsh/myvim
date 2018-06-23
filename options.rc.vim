"-----------------------------------------------------------------------
" Search:
"

" Ignore the case of normal letters.
set ignorecase
" If the search pattern conteins upper case characters,
" override ignorecase option.
set smartcase

" Enable incremental search.
set incsearch
" Don't highlight search result.
set nohlsearch

" Searches wrap around the ent of the file.
set wrapscan

set number


"-----------------------------------------------------------------------
" Edit:
"

" Smart insert tab setting.
set smarttab
" Exchange tab to spaces.
set expandtab
" Autoindent width.
set shiftwidth=2
" Round indent by shiftwidth.
set shiftround

" Enable smart indent.
set autoindent smartindent

" Disable modeline.
set modelines=0
set nomodeline

" Enable backspace delete indent and newline.
set backspace=indent,eol,start

" Highlight <>.
set matchpairs+=<:>

" Display another buffer when current buffer isn't saved.
set hidden

" Enable folding.
set foldenable
set foldmethod=marker
" Show folding level.
set foldcolumn=1
set fillchars=vert:\|
set commentstring=%s

" FastFold
autocmd MyAutoCmd TextChangedI,TextChanged *
      \ if &l:foldenable && &l:foldmethod !=# 'manual' |
      \   let b:foldmethod_save = &l:foldmethod |
      \   let &l:foldmethod = 'manual' |
      \ endif
autocmd MyAutoCmd BufWritePost *
      \ if &l:foldmethod ==# 'manual' && exists('b:foldmethod_save') |
      \   let &l:foldmethod = b:foldmethod_save |
      \   execute 'normal! zx' |
      \ endif

if exists('*FoldCCtext')
  " Use FoldCCtext().
  set foldtext=FoldCCtext()
endif
