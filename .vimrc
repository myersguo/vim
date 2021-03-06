set encoding=utf-8
set nobackup	
set showcmd
set nu  
set autoindent
set tabstop=4
set shiftwidth=4
set mouse=a
set hlsearch 
set showmatch 
set history=100
set t_Co=256
"colors github
syntax on
colorscheme desert

autocmd FileType html set ts=2 sts=2 sw=2
autocmd FileType javascript set ts=4 sts=4 sw=4


inoremap <C-f> <Right>
inoremap <C-b> <Left>


set pastetoggle=<C-P> " Ctrl-P toggles paste mode


map <F12> :let &mouse=(&mouse == "a"?"v":"a")<CR>

"Ctags
nmap <F9> <Esc>:!ctags -R *<CR>
"taglist
" ony show one file tags
let Tlist_Show_One_File=1
"close windows when only taglist
let Tlist_Exit_OnlyWindow=1
"let others file auto close
let Tlist_File_Fold_Auto_Close=1
let TList_Show_Menu=1
"let Tlist_Auto_Open=1
"let Tlist_Use_Right_Window=1
nmap <F5> :TlistToggle <CR>

 
"minibuf
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0

"winmanager

let g:winManagerWidth = 30
"let g:AutoOpenWinManager = 1 

let g:NERDTree_title="[NERDTree]"  
"let g:winManagerWindowLayout = "FileExplorer|TagList,BufExplorer"
let g:winManagerWindowLayout="NERDTree|TagList,BufExplorer"
function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap wm :WMToggle<CR>
"nmap <silent> <F8> :WMToggle<cr>

"cscope
if has("cscope")
      set csprg=/usr/bin/cscope
      set csto=0
      set cst
      set nocsverb
      " add any database in current directory
      if filereadable("cscope.out")
          cs add cscope.out
      " else add database pointed to by environment
      elseif $CSCOPE_DB != ""
          cs add $CSCOPE_DB
      endif
      set csverb
endif
"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <F2> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <F3> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F4> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F5> :cs find f 
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>


nmap <F6> :NeoComplCacheDisable<CR><CR>
nmap <F7> :NeoComplCacheEnable<CR><CR>

"Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 0
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
   \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"


" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


function! AutoPair(open, close)
        let line = getline('.')
        if col('.') > strlen(line) || line[col('.') - 1] == ' ' 
                return a:open.a:close."\<ESC>i"
        else
                return a:open
        endif
endf
 
function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf
 
function! SamePair(char)
        let line = getline('.')
        if col('.') > strlen(line) || line[col('.') - 1] == ' ' 
                return a:char.a:char."\<ESC>i"
        elseif line[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf
inoremap ( <c-r>=AutoPair('(', ')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=AutoPair('{', '}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ <c-r>=AutoPair('[', ']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=SamePair('"')<CR>
inoremap ' <c-r>=SamePair("'")<CR>
inoremap ` <c-r>=SamePair('`')<CR>
 
 
autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()"  |  exec  ":normal Go"
 
autocmd BufNewFile *.php exec ":call SetPhpComment()" | exec  ":normal Go"
 
func SetPhpComment()
     call setline(1,"<?php")
     call append(line("."),"/*===========================================")
     call append(line(".")+1,   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
     call append(line(".")+2, "*   ")
     call append(line(".")+3, "*   company      : xiaomi")
     call append(line(".")+4, "*   author       : " .$USER."")
     call append(line(".")+5, "*   email        : " .$USER."@xiaomi.com")
     call append(line(".")+6, "*   date         ：".strftime("%Y-%m-%d %H:%M:%S"))
     call append(line(".")+7, "*   description  ：")
     call append(line(".")+8, "*")
     call append(line(".")+9, "=============================================*/")
endfunc

 func SetComment()
     call setline(1,"/*===========================================")
     call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
     call append(line(".")+1, "*   ")
     call append(line(".")+2, "*   company      : xiaomi")
     call append(line(".")+3, "*   author       : " .$USER."")
     call append(line(".")+4, "*   email        : " .$USER."@xiaomi.com")
     call append(line(".")+5, "*   date         ：".strftime("%Y-%m-%d %H:%M:%S"))
     call append(line(".")+6, "*   description  ：")
     call append(line(".")+7, "*")
     call append(line(".")+8, "=============================================*/")
 endfunc
 
func SetTitle()
     call SetComment()
     if expand("%:e") == 'h'
  call append(line(".")+9, "#ifndef _".toupper(expand("%:t:r"))."_H_")
  call append(line(".")+10, "#define _".toupper(expand("%:t:r"))."_H_")
  call append(line(".")+11, "")
  call append(line(".")+12, "")
  call append(line(".")+13, "")
  call append(line(".")+14, "")
  call append(line(".")+15, "")
  call append(line(".")+16, "")
  call append(line(".")+17, "")
  call append(line(".")+18, "#endif //_".toupper(expand("%:t:r"))."_H")
     elseif &filetype == 'c'
  call append(line(".")+9,"#include \"".expand("%:t:r").".h\"")
     elseif &filetype == 'cpp'
  call append(line(".")+9, "#include \"".expand("%:t:r").".h\"")
 
     endif
endfunc


function! KeywordsAll()
    setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc

function! KeywordsBasic()
    setl iskeyword=@,48-57,192-255
endfunc

" improve the 'search word under cursor' behavior
nnoremap * :silent call KeywordsAll() * :silent call KeywordsBasic()
nnoremap # :silent call KeywordsAll() # :silent call KeywordsBasic()

augroup is_keyword
  " clear commands before resetting
  autocmd!
  " make sure `complete` works as expected for CSS class names whithout
  " messing with motions (eg. '.foo-bar__baz') and we make sure all
  " delimiters (_,-,$,%,.) are treated as word separators outside insert mode
  autocmd InsertEnter,BufLeave * :call KeywordsAll()
  autocmd InsertLeave,BufEnter * :call KeywordsBasic()
  " yes, we need to duplicate it on VimEnter for some weird reason
  autocmd VimEnter * nnoremap * :silent call KeywordsAll() * :silent call KeywordsBasic()
  autocmd VimEnter * nnoremap # :silent call KeywordsAll() # :silent call KeywordsBasic()
augroup END

set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

augroup omni_complete
  " clear commands before resetting
  autocmd!
  " Enable omnicomplete for supported filetypes
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
