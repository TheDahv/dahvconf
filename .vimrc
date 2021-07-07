" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" vim-plug config
call plug#begin('~/.vim/plugged')

" Awesome post regarding newer plugins and Vim8 config
" https://statico.github.io/vim3.html

" On-Demand loading example
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '/opt/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'majutsushi/tagbar'
" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'epeli/slimux'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'sotte/presenting.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'flowtype/vim-flow'
" the path to python3 is obtained through executing `:echo exepath('python3')` in vim
let g:python3_host_prog = "/usr/local/bin/python3"

" Colorschemes and themes
Plug 'reedes/vim-colors-pencil'
Plug 'arcticicestudio/nord-vim'
Plug 'nightsense/seabird'

" Interesting stuff, but not useful right now
" Plug 'dermusikman/sonicpi.vim'

" Orgmode stuff
" Install exuberant-ctags
" sudo apt update && sudo apt install exuberant-ctags
Plug 'chrisbra/NrrwRgn'
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/SyntaxRange'

" Language-specific plugins
" Plug 'lukaszkorecki/CoffeeTags'
Plug 'tpope/vim-markdown', { 'for': 'md' }
" Plug 'mtscout6/vim-cjsx', { 'for': 'coffee' }
" Plug 'kchmck/vim-coffee-script' " , { 'for': 'coffee' }
Plug 'mustache/vim-mustache-handlebars' " , { 'for': 'hbs' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'groenewege/vim-less', { 'for': 'less' }
" Plug 'jwhitley/vim-literate-coffeescript', { 'for': 'litcoffee' }
Plug 'let-def/ocp-indent-vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'rescript-lang/vim-rescript'
" Plug 'jordwalke/vim-reasonml'
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'rust-lang/rust.vim' " , { 'for': 'rust' }
Plug 'flowtype/vim-flow'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-fireplace'
Plug 'liquidz/vim-iced'
Plug 'elixir-editors/vim-elixir'
Plug 'tell-k/vim-autopep8'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'dart-lang/dart-vim-plugin'

" Initialize plugin system
call plug#end()

" Syntax highlighting
if has("syntax") && (&t_Co > 2 || has("gui_running"))
  syntax on
endif

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Use json sytax for jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

" Set to autoread when a file is modified from the outside
set autoread

" Leader
" Fun Leader Tricks: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"

" Repeat.vim settings
" Example for hooking a new plugin into the repeat system
" silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" " Open Ctrl-P with leader
" nnoremap <Leader>o :CtrlP<CR>
" " Ignore git folder when indexing a project
" let g:ctrlp_use_caching = 0
" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" else
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"   let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>']
"     \ }
" endif

" FZF
nmap ; :Buffers<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>r :Tags<CR>

" RIP AG.vim
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" Hook up FZF to Ag
nmap <leader>a :Ag<CR>

" Fast editing of vimrc
nmap <leader>e :e! ~/.vimrc<CR>

" Toggle line numbers
nmap <leader>n :set invnumber<CR>
" Disable highlight
nmap <leader>h :noh<CR>

" saves a file
nmap <leader>s :w<CR>
imap <leader>s <ESC>:w<CR>
vmap <leader>s <ESC>:w<CR>

nmap <D-s> :w<CR>
imap <D-s> <ESC>:w<CR>
vmap <D-s> <ESC>:w<CR>

" Show trailing whitespace in a file
map <leader>ws /\s\+$<cr>
" Delete trailing shitepace in a file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Reload vimrc when edited
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" Interface
set ruler

" Set some extra lines for scope
set scrolloff=5

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Turn off search highlighting
nnoremap <leader><space> :noh<CR>

" set cc=80
set cc=0

if has('guirunning')
  " Macvim Font
  " set macligatures
  " set guifont=Fira\ Code\ Light:h12
  set guifont=Iosevka:h14

  set lines=50
  set columns=180
  autocmd! bufwritepost ~/.gvimrc source ~/.gvimrc
endif

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf8
try
  lang en_US
catch
endtry

set ffs=unix,dos,mac " Default file types

" Backup stuff
set nobackup
set nowb
set noswapfile

" Tabs
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines
set tw=80

autocmd FileType go setlocal noexpandtab shiftwidth& tabstop& softtabstop& smarttab&

set foldmethod=indent
set foldlevel=100

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set showmode
set scrolljump=5
set scrolloff=3
set wildmenu
set wildmode=list:longest
set nospell
" set cursorline
set lazyredraw
set cmdheight=2

" Autosuggestion config
set updatetime=300
" Don't pass messages to |ins-completion-menu}
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" In many terminal emulators the mouse works just fine, thus enable it.
" It turns out having the cursor jump becaus I accidentally touched the
" mousepad sucks. Disabling this.
" if has('mouse')
"   set mouse=a
" endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif

" Colorschemes
" solarized
" colorscheme nord
" colorscheme seagull
" colorscheme greygull
" colorscheme petrel
"colorscheme stormpetrel
"colorscheme solarized
" set t_Co=256
" let g:solarized_termcolors=256
" set term=xterm-256color
" set background=dark
" colorscheme pencil
set background=light
"colorscheme fog
colorscheme snow
let g:pencil_neutral_headings = 1
let g:pencil_gutter_color = 1
let g:pencil_terminal_italics = 1
" call togglebg#map("<F9>")

" NERDTree
autocmd VimEnter * nmap <leader>3 :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=35

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Invisible characters
" set list
set listchars=tab:▸\ ,eol:¬

" JSON highlighting
au BufNewFile,BufRead *.json set filetype=javascript

" JS / JSX linting
" 'javascript': ['flow', 'eslint'],
"let g:ale_linters = {
"  \ 'javascript': ['flow', 'eslint']
"  \ }
" let g:ale_javascript_prettier_use_local_config = 1
"let g:ale_fixers = {
"  \ 'typescript': ['prettier-standard'],
"  \ 'tsx': ['prettier-standard'],
"  \ }
" \ 'javascript': ['flow-language-server', 'eslint'],
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'rust': ['cargo'],
  \ }
" let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_fix_on_save = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

" Flow stuff
let g:flow#autoclose = 1
let g:flow#showquickfix = 0

" Gemfile highlighting
au BufNewFile,BufRead Gemfile set filetype=ruby

let g:lisp_rainbow=1
" let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"clisp ~/.vim/bundle/slimv/slime/start-swank.lisp\""'

set foldmethod=indent

" Distraction-free writing on Markdown files
" http://www.laktek.com/2012/09/05/distraction-free-writing-with-vim/
"au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()
function! DistractionFreeWriting()
    map <F5> :setlocal spell! spelllang=en_us<CR> " Spellcheck for Macvim
    colorscheme iawriter
    set background=light
    set gfn=Cousine:h14                " font to use
    set lines=40 columns=100           " size of the editable area
    set tw=79                          " wrap at 80 characters
    set fuoptions=background:#00f5f6f6 " macvim specific setting for editor's background color
    set guioptions-=r                  " remove right scrollbar
    set laststatus=0                   " don't show status line
    set noruler                        " don't show ruler
    set fullscreen                     " go to fullscreen editing mode
    set linebreak                      " break the lines on words
endfunction
" Turn off MacVim native fullscreen
" defaults write org.vim.MacVim MMNativeFullScreen 0

" Powerline settings
let g:airline_powerline_fonts = 1
" let g:airline_theme='base16'
" let g:airline_theme='bubblegum'
let g:airline_solarized_bg='dark'
" let g:airline_theme='lucius'
let g:airline_theme='minimalist'

" CoffeeScript settings
"autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
"autocmd FileType litcoffee runtime ftplugin/coffee.vim
"let coffee_lint_options = '-f ~/.coffeelint.json'

"function! LintCoffee()
"  :CoffeeLint! | cwindow
"endfunction

"autocmd BufWritePost *.coffee call LintCoffee()

" let g:tagbar_type_coffee = {
"     \ 'ctagstype' : 'coffee',
"     \ 'kinds'     : [
"         \ 'c:classes',
"         \ 'm:methods',
"         \ 'f:functions',
"         \ 'v:variables',
"         \ 'f:fields',
"     \ ]
" \ }

" vim-orgmode - Find more in :helpgrep orgguide - /org-mappings
let g:org_heading_shade_leading_stars = 0
let g:org_agenda_files = ["~/notes/*.org"]
au FileType org nnoremap <leader>T :OrgCheckBoxToggle<CR>
au FileType org nnoremap <leader>ic :OrgDateInsertTimestampActiveCmdLine<CR>

au FileType org nnoremap <leader>agl :OrgAgendaTimeline<CR>
au FileType org nnoremap <leader>agt :OrgAgendaTodo<CR>
au FileType org nnoremap <leader>agw :OrgAgendaWeek<CR>

" Silver searcher - https://github.com/rking/ag.vim
" :Ag [options] {pattern} [{directory}]
" e    to open file and close the quickfix window
" o    to open (same as enter)
" go   to preview file (open but maintain focus on ag.vim results)
" t    to open in new tab
" T    to open in new tab silently
" h    to open in horizontal split
" H    to open in horizontal split silently
" v    to open in vertical split
" gv   to open in vertical split silently
" q    to close the quickfix window

" Vim instant markdown
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 1
nnoremap <leader>p :InstantMarkdownPreview<CR>
let g:markdown_fenced_languages = ['html', 'bash=sh']

" Go settings
let g:go_fmt_command = "goimports"

" highlighting for funcs/methods/structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" au BufWritePost *.go GoMetaLinter
au BufWritePost *.go GoLint

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>cc <Plug>(go-test-compile)

" au FileType go nmap <F8> :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Toggle scrolloff modes
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
" Start in 'scroll in center' mode
set so=999

" Nim
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" Copy to clipboard
set clipboard=unnamed

" Slimux setup
nnoremap <Leader>ci :SlimuxREPLConfigure<CR>
nnoremap <Leader>cl :SlimuxREPLSendLine<CR>
vnoremap <buffer> <Leader>vv :SlimuxREPLSendSelection:w<CR>
" vnoremap <buffer> <Leader>cs :SlimuxREPLSendSelection:w<CR>

" Clojure
let g:iced_enable_default_key_mappings = v:true

" TODO Move to Rust ftplugin
" " Rust
"  https://github.com/rust-lang/rust.vim/issues/130
let g:rustfmt_autosave = 1
" let g:syntastic_rust_rustc_exe = 'cargo check'
" let g:syntastic_rust_rustc_fname = ''
" let g:syntastic_rust_rustc_args = '--'
" let g:syntastic_rust_checkers = ['rustc']

" let g:ycm_rust_src_path = '~/Development/rust/src/1.20.0/src'

nmap \r :!tmux send-keys -t circuit-breaker:0.1 C-l C-p C-j <CR><CR>

function! ExeSql()
  let g:query = @q
  if g:query == ""
    echo "no sql to execute"
    return 0
  endif

  call writefile(split(g:query, "\n"), "/tmp/sqltmp")

  if exists("g:sql_run_buffer")
    set swb=usetab
    exec ":rightbelow sbuf " . g:sql_run_buffer
  else
    bo new
    set buftype=nofile
    let g:sql_run_buffer = bufnr("%")
  endif

  let sqlcmd = "%! cat /tmp/sqltmp | vim-sql 2>&1 | grep -v Warning"
  exec sqlcmd
endfunction
map <Leader>ss "qy:call ExeSql()<CR>

" OCaml
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
"
"autocmd FileType ocaml source substitute(system('opam config var share'), '\n$', '', '''') . "/typerex/ocp-indent/ocp-indent.vim"

" Vim needs to be built with Python scripting support, and must be
" able to find Merlin's executable on PATH.
"if executable('ocamlmerlin') && has('python')
"  let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/ocamlmerlin"
"  execute "set rtp+=".s:ocamlmerlin."/vim"
"  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
"endif

" Reason
set hidden
" \ 'reason': ['/home/ubuntu/bin/reason-language-server.exe'],
" \ 'reason': ['esy', 'ocaml-language-server', '--stdio'],
let g:LanguageClient_serverCommands = {
  \ 'reason': ['/home/david/bin/reason-language-server'],
  \ 'ocaml': ['/home/ubuntu/bin/reason-language-server.exe'],
  \ 'typescript': ['tsserver'],
  \ }

let g:ycm_semantic_triggers = {
  \ 'rust' : ['.', '::'],
  \ 'ocaml' : ['.', '#'],
  \ 'reason' : ['.', '#'],
  \ }

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd : call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>

function! FormatPrettier()
  set autoread
  execute "silent !" . 'npx prettier-standard' . ' ' . bufname("%")
endfunction
au BufWritePost *.tsx :silent! call FormatPrettier() | redraw!
au BufWritePost *.ts :silent! call FormatPrettier() | redraw!
nmap <Leader>, :silent! call FormatPrettier() <bar> redraw!<CR>

function! FormatRescript()
  " Check if the file is valid before formatting
  execute "silent !" . 'npx bsc ' . bufname("%")
  if v:shell_error
    echo 'compilation error'
    return
  endif

  " Save cursor position: https://stackoverflow.com/a/7086709
  let _s=@/
  let l = line(".")
  let c = col(".")
  let @/=_s

  set autoread
  execute "silent %!" . 'npx bsc -format' . ' ' . bufname("%")

  " Set cursor after redraw
  call cursor(l, c)
endfunction
"au BufWritePost *.res :silent! call FormatRescript() | redraw!

"autocmd! bufwritepost *.re call LanguageClient_textDocument_formatting()
