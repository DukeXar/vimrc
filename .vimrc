set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'a.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'FSwitch'
Plugin 'wincent/Command-T'
Plugin 'Valloric/YouCompleteMe'

let g:load_doxygen_syntax=1

filetype plugin indent on

let python_highlight_all=1

let g:CommandTFileScanner = 'watchman'
let g:CommandTMaxHeight = 30
let g:CommandTMaxFiles = 500000
let g:CommandTInputDebounce = 200

let g:ycm_server_log_level = 'debug'

syntax on

set hlsearch incsearch smartcase
set modeline
set wildmenu
set wildignore=*.o,*.cdp,*.a,*.pyc,*.log
set laststatus=2
"set foldmethod=syntax
set virtualedit=all
set autoindent
set backspace=indent,eol,start

set listchars=tab:>-,trail:·,eol:¬

au BufRead,BufNewFile Makefile*,*.mak,*.m set noet
au BufRead,BufNewFile *.rb,*.rake,*.erb set et sw=2 ts=2
au BufRead,BufNewFile *.py,*pyw set sw=4 ts=4 et
au BufRead,BufNewFile *.cc,*.cpp,*.cxx,*.h,*.hpp set sw=2 ts=8 et
au BufRead,BufNewFile *.cmake,CMakeLists.txt set sw=4 ts=8 et tw=120 ft=cmake
au BufRead,BufNewFile *.html,*.js,*.json set sw=2 ts=8 et tw=120
au BufRead,BufNewFile *erl,*erh,Emakefile set sw=4 ts=4 et ft=erlang

"let moria_style="dark"
"let moria_fontface="mixed"
colorscheme moria
"colorscheme manuscript

if has("gui_running")
    "set guifont=Terminus\ 10
    set guifont=Monospace\ 10
    set guioptions-=T " remove toolbar
endif

" Bad spaces
"highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
" Make trailing whitespace be flagged as bad.
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cc,*.cpp,*.hpp,*.mak,*.sym match BadWhitespace /\(\s\+$\)\|\(^\t\+\)/

vnoremap < <gv
vnoremap > >gv

" Tabbed interface
" tab all
" au BufAdd,BufNewFile,BufRead * nested tab sball
map <F10> :bp<CR>
map <F11> :bn<CR>

" map <C-t> :tabnew<CR>
" map <F10> :tabp<CR>
" map <F11> :tabn<CR>

au BufWinLeave ?* mkview
au BufWinEnter ?* silent! loadview

set completeopt-=preview

" Some keymaps
" map <F10> :bp
" map <F11> :bn

map <F3> :set paste!
map <F4> :set number!
map <F5> :cp
map <F6> :cope
map <F7> :cn
map <F8> :NERDTreeToggle

map <F12> :nohlsearch
imap <F12> <Esc>:nohlsearchi
"map <F9> :make -C build --no-print-directory

"let autotagCtagsCmd="ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
"source ~/.vim/plugin/autotag.vim

"source ~/.vim/plugin/ifdefautocomment.vim

" TODO
"map <F2> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" Append modeline after last line in buffer.
" Use substitute() (not printf()) to handle '%%s' modeline in LaTeX files.
"function! AppendModeline()
"    let save_cursor = getpos('.')
"    let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.' tw='.&textwidth.': '
"    $put =substitute(&commentstring, '%s', append, '')
"    call setpos('.', save_cursor)
"endfunction
"nnoremap <silent> <Leader>ml :call AppendModeline()<CR>


" Automatic templates


"if !exists("autocommands_loaded")
"  "let autocommands_loaded = 1
"  "au BufNewFile *.h call InsertCHHeader()
"  " You might want to comment-out the line below - see note 6 at the end of the post.
"  " au BufReadPost *.h call ModifyHeader()
"endif
"
"function! InsertCHHeader()
"  call InsertSkeleton("skeleton.h") " CHANGE this!
"  call InsertFname()
"  1
"  " Search for Description
"  call search("@brief")
"  normal $
"  startinsert!
"endfunction
"
"function! InsertSkeleton(fname)
"  let path_to_skeletons = $HOME . "/etc/skeletons/" " CHANGE this!
"  " Save cpoptions
"  let cpoptions = &cpoptions
"  " Remove the 'a' option - prevents the name of the
"  " alternate file being overwritten with a :read command
"  exe "set cpoptions=" . substitute(cpoptions, "a", "", "g")
"  exe "read " . path_to_skeletons . a:fname
"  " Restore cpoptions
"  exe "set cpoptions=" . cpoptions
"  " Delete the first line into the black-hole register
"  1, 1 delete _
"  " Search for Filename:
"  call search("@file")
"  exe "normal A" . expand("%:t")
"endfunction
"
"function! InsertFname()
"  " Convert newname.h to _NEWNAME_H_
"  let fname = expand("%:t")
"  let fname = toupper(fname)
"  let fname = substitute(fname, "\\.", "_", "g")
"  " Search for #ifndef
"  call search("#ifndef")
"  exe "normal A " . fname . "_INCLUDED__"
"  " Search for #define
"  call search("#define")
"  exe "normal A " . fname . "_INCLUDED__"
"  " Search for #endif
"  call search("#endif")
"  exe "normal A // " . fname . "_INCLUDED__"
"endfunction
"
"function! ModifyHeader()
"  " Modify header only if we have write permissions
"  if &readonly == 0
"     call search("@file", "e")
"     exe "normal a " . expand("%:t")
"     exe "normal ldE"
"  endif
"endfunction

" add any database in current directory
"if filereadable("tags")
"   set tags=tags
"else
"   set tags=/home/adrianc/code/tags
"endif
"set cursorcolumn
"if has("cscope")
"   set csprg=/usr/bin/cscope
"   set csto=0
"   set cspc=0
"   set cst
"   set nocsverb
"   " add any database in current directory
"   if filereadable("cscope.out")
"     cs add cscope.out 
"   elseif $CSCOPE_DB!=""
"      cs add $CSCOPE_DB
"   endif
"   set csverb
"
"    """"""""""""" My cscope/vim key mappings
"    "
"    " The following maps all invoke one of the following cscope search types:
"    "
"    "   's'   symbol: find all references to the token under cursor
"    "   'g'   global: find global definition(s) of the token under cursor
"    "   'c'   calls:  find all calls to the function name under cursor
"    "   't'   text:   find all instances of the text under cursor
"    "   'e'   egrep:  egrep search for the word under cursor
"    "   'f'   file:   open the filename under cursor
"    "   'i'   includes: find files that include the filename under cursor
"    "   'd'   called: find functions that function under cursor calls
"    "
"    " Below are three sets of the maps: one set that just jumps to your
"    " search result, one that splits the existing vim window horizontally and
"    " diplays your search result in the new window, and one that does the same
"    " thing, but does a vertical split instead (vim 6 only).
"    "
"    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
"    " unlikely that you need their default mappings (CTRL-\'s default use is
"    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
"    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
"    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
"    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
"    " (which also maps to CTRL-/, which is easier to type).  By default it is
"    " used to switch between Hebrew and English keyboard mode.
"    "
"    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
"    " that searches over '#include <time.h>" return only references to
"    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
"    " files that contain 'time.h' as part of their name).
"
"
"    " To do the first type of search, hit 'CTRL-\', followed by one of the
"    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
"    " search will be displayed in the current window.  You can use CTRL-T to
"    " go back to where you were before the search.  
"    "
"
"    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
"    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
"    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
"    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
"    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
"    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
"    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  
"
"
"    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
"    " makes the vim window split horizontally, with search result displayed in
"    " the new window.
"    "
"    " (Note: earlier versions of vim may not have the :scs command, but it
"    " can be simulated roughly via:
"    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR> 
"
"    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR> 
"    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR> 
"    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR> 
"    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR> 
"    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR> 
"    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
"    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>  
"    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR> 
"
"
"    " Hitting CTRL-space *twice* before the search type does a vertical 
"    " split instead of a horizontal one (vim 6 and up only)
"    "
"    " (Note: you may wish to put a 'set splitright' in your .vimrc
"    " if you prefer the new window on the right instead of the left
"
"    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>   
"    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
"    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"
"
"    """"""""""""" key map timeouts
"    "
"    " By default Vim will only wait 1 second for each keystroke in a mapping.
"    " You may find that too short with the above typemaps.  If so, you should
"    " either turn off mapping timeouts via 'notimeout'.
"    "
"    "set notimeout 
"    "
"    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
"    " with your own personal favorite value (in milliseconds):
"    "
"    "set timeoutlen=4000
"    "
"    " Either way, since mapping timeout settings by default also set the
"    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
"    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
"    " delays as vim waits for a keystroke after you hit ESC (it will be
"    " waiting to see if the ESC is actually part of a key code like <F1>).
"    "
"    "set ttimeout 
"    "
"    " personally, I find a tenth of a second to work well for key code
"    " timeouts. If you experience problems and have a slow terminal or network
"    " connection, set it higher.  If you don't set ttimeoutlen, the value for
"    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
"    "
"    "set ttimeoutlen=100
"endif
