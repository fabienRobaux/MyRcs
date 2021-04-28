

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/csapprox'
Plug 'effi/vim-OpenFoam-syntax'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'rdnetto/YCM-Generator'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'vim-latex/vim-latex'
call plug#end()


let mapleader="," 

" for "!command" to behave like "command" in the shell
let $BASH_ENV = "~/.bash_aliases"


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" to be able to find recursively with :find
set path+=**

" to scroll when mutiple answer with tab on  a lower menu
set wildmenu

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set mouse=a                " disable mouse
set noerrorbells            " no sound
set ruler
set spell
set cursorline              " Highlight current line
set laststatus=2            " Always show status line
set cmdheight=2

" Numbers
set number
set numberwidth=1
set relativenumber

" auto complete filename
set wildignorecase
set wildmode=list:longest,full

" menu
set completeopt=menuone,preview

set report=0                " Show all changes.
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set title                   " Show the filename in the window title bar.
set cursorline              " show a visual line under the cursor's current line
set scrolloff=5             " Start scrolling n lines before horizontal

set t_Co=256                " 256 color support
set hidden                  " do something with buffer

set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
"   horizontally
set autowrite               " autosave
set autoread								" reading a file

set smarttab                    " Better tabs

" Indentation
set smartindent                 " Insert new level of indentation
set autoindent                  " Copy indentation from previous line
set tabstop=2                   " Columns a tab counts for
set softtabstop=2               " Columns a tab inserts in insert mode
set shiftwidth=2                " Columns inserted with the reindent operations
set shiftround                  " Always indent by multiple of shiftwidth
set expandtab                   " Always use spaces instead of tabs

" Temp Files
set nobackup                    " No backup file
set noswapfile                  " No swap file
set nowb



"highlight Comment guifg=Red ctermfg=Red
"highlight Function guifg=Blue ctermfg=Blue

" package NerdTree
"nmap <leader>t :NERDTreeToggle <CR>
nmap <leader>T :NERDTree<CR>
nmap <leader>t :NERDTreeFind 
nmap <leader>tc :NERDTreeClose 
let NERDTreeMapOpenVSplit ='s' " it is also the default but put there to remember, and difficult to change without conflict

set spell spelllang=en_us,fr
nmap zn ]s
nmap zp [s


" map to suppress current highlighting
nmap <leader><space> :noh<CR>


" History
set history=1000                " Remember more commands
if has('persistent_undo')
    set undofile                " Persistent undo
    set undodir=~/.vim/.undo//    " Location to store undo history
    set undolevels=1000         " Max number of changes
    set undoreload=10000        " Max lines to save for undo on a buffer reload
endif

set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/


" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa



"%% is thus the path of the current file
cabbr %% <C-R>=expand('%:p:h')<CR>
cabbr %H <C-R>=expand('%:r:t') . ".H"<CR>
cabbr %C <C-R>=expand('%:r:t') . ".C"<CR>
iabbr %t <C-R>=expand("%:t:r") <CR>
cabbr $w <C-R>=expand("<cword>")<C-R>



set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
hi CursorLine   cterm=NONE ctermbg=254 ctermfg=NONE
colorscheme desert


"%% setting wrap in diff environement
"autocmd FilterWritePre * if &diff | setlocal wrap< | endif
au VimEnter * if &diff | execute 'windo set wrap' | endif

" specific setup environment depending on project, project specific
function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/home/fabien/foam/' || l:path =~ '/home/fabien/foam/fabien-4.1/'
    echo "setting for openfoam"
    setlocal expandtab smarttab smartcase
    if &filetype == 'cpp'
      setlocal tabstop=4 shiftwidth=4
    else
      setlocal tabstop=2 shiftwidth=2
    endif
    if l:path =~ '/home/fabien/foam/foam-extend-4.1' || l:path =~ '/home/fabien/foam/fabien-4.1/'
      echo "setting tags accordingly"
      set tags+=/home/fabien/foam/foam-extend-4.1/tags;/home/fabien/foam/foam-extend-4.1/.tags;/home/fabien/foam/foam-extend-4.1/.tags/etags;/home/fabien/foam/fabien-4.1/tags


      let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
      let g:ycm_server_use_vim_stdout = 1
      let g:ycm_server_log_level = 'debug'

    endif
  elseif l:path =~ '/home/user/projects'
    setlocal tabstop=2 shiftwidth=4 noexpandtab
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()


" return to last position
if has("autocmd")
  augroup redhat
  autocmd!
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  augroup END


  autocmd FileType markdown,md :call Markdown_settings()
  let g:tex_flavor='latex'
  autocmd FileType tex,latex,plaintex :call Tex_settings()
endif


let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1 "Not working ??
let g:ycm_autoclose_preview_window_after_insertion = 1

nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap <leader>vgt :vsplit \| YcmCompleter GoToDefinition<CR>
command Ycmupd YcmForceCompileAndDiagnostics
nmap <leader>rp :!realpath %:p



" Type specific function
"
function! Markdown_settings()
    " from package https://github.com/JamshedVesuna/vim-markdown-preview
    " to view in your browser the results of a markdown file, need 
    "  - grip (pip install --user grip)
    " installed 
    "
    nmap <leader>lv :call Vim_Markdown_Preview()<CR> 
    let g:vim_markdown_preview_github=1
    let g:vim_markdown_preview_use_xdg_open = 1
    setlocal spell
endfunction



" ******* LATEX WITH VIM **************
" package: "vim-latex"
"
"  **** COMPILING
" when compiling, use <leader>, its objective will be to do a
"   - g:Tex_DefaultTargetFormat file
let g:Tex_DefaultTargetFormat='pdf'

" To do this file, we will need the dependency to create this:
"   - g_TexFormatDependecy_pdf
" For example if g_TexFormatDependecy_pdf='dvi,ps,pdf", he will compile the
" dvi then the ps then the pdf
let g:Tex_FormatDependency_pdf='pdf'
let g:Tex_FormatDependency='pdf'

" For each on in Tex_FormatDependency, you will need an action: 

" Which format can be compiled multiple times (if ref or label are not ok
" yet)?
let g:Tex_MultipleCompileFormats= 'pdf'

"" **** BIBLIO <leader>lb

"" **** VIEW IN PDF, Okular so that with <leader>ls => goes to the cursor"
"" placement in the pdf
"" For reverse seach in okular Setting=>Cinfigure Okular=>Editor=> Cutom Text Editor gvim --servername GVIM --remote +%l %f
"" press <Schift> click, to open (or reload) gvim at the current location
"let g:Tex_ViewRule_pdf='evince $*.pdf'
let g:Tex_ViewRule_pdf='okular --unique'
let g:Tex_GotoError=0

function! Tex_settings()
    setlocal spell
endfunction


function! SetBiber()
    let g:Tex_BibtexFlavor = 'biber'
    map <Leader>lb :<C-U>exec '!biber '.expand('%:p:h').'/'.Tex_GetMainFileName(':p:t:r').'.bcf' ' --output-safechars'<CR>
endfunction

function! SetBitex()
    let g:Tex_BibtexFlavor = 'bibtex'
    map <Leader>lb :<C-U>exec '!bitex '.expand('%:p:h').'/'.Tex_GetMainFileName(':p:t:r').'.aux'<CR>
endfunction


function! SetupEnvironment()
  echo "setup tex environment"
  let local_vim = ".vimrc"
  let l:path = expand('%:p:h')

  if filereadable(l:path . "/" . local_vim ) 
        echo "found a .vimrc, loading it"
        exe ":so" . l:path  . "/" . local_vim 
  else
      if l:path =~ '/home/robaux/These/Presentation/20'

            if &filetype == 'tex'
                let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode -file-line-error -synctex=1 $*'
                let g:Tex_FoldedEnvironments='verbatim,comment,eq,gather, align,figure,table,thebibliography, keywords,abstract,titlepage,frame,tikzpicture'
                :call IMAP('EFR',"\\begin{frame}{<++>}\<CR><++>\<CR>\\end{frame}", 'tex')
            endif

      else
        if &filetype == 'tex'
            let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode -file-line-error -synctex=1 $*'
        endif
      endif
      call SetBiber()
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()




set spell spelllang=en_us,fr
nmap zn ]s
nmap zp [s



