" This file should be at ~/.config/nvim/init.vim
call plug#begin('~/.nvim/plugged')
" Autocomplete list functionality
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
" Autocomplete with tern for JavaScript
Plug 'carlitux/deoplete-ternjs'
" Automatically handle swapfiles
Plug 'gioele/vim-autoswap'
" Keep list of yanks, use Ctrl-p to scroll through
Plug 'vim-scripts/YankRing.vim'
" Use tab for insert mode completions
Plug 'ervandew/supertab'
" Async live linter
Plug 'w0rp/ale'
" Change syntax surroundings like parens or quotes
Plug 'tpope/vim-surround'
" Git gutter
Plug 'airblade/vim-gitgutter'
" Git commands
Plug 'tpope/vim-fugitive'
" Undo tree with leader-u
Plug 'sjl/gundo.vim'
" Project tree
Plug 'scrooloose/nerdtree'
" Easy code commenting
Plug 'scrooloose/nerdcommenter'
" For showing where the indents line up
Plug 'Yggdroot/indentLine'
" Match the tmux status line to the lightline settings
Plug 'edkolev/tmuxline.vim'
" Beautiful minimal simple status line that doesn't suck at all
Plug 'itchyny/lightline.vim'
" Autocomplete html tags
Plug 'mattn/emmet-vim'
" Webapi is required for gist below
Plug 'mattn/webapi-vim'
" Create gists with :Gist
Plug 'mattn/gist-vim'
" Better JS highlighting
Plug 'pangloss/vim-javascript'
" Better JS libraries highlighting
Plug 'othree/javascript-libraries-syntax.vim'
" JSX highlighting
Plug 'mxw/vim-jsx'
" Fuzzy file finder - includes Ag for ack-like functionality
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Better tabbing - required for vim-markdown
Plug 'godlygeek/tabular'
" Markdown highlighting and folding
Plug 'plasticboy/vim-markdown'
" For prose, soft vs hard line breaks, sane wrapping and undos, etc
Plug 'reedes/vim-pencil'
" Autocorrect common spelling errors
Plug 'reedes/vim-litecorrect'
" Distraction free writing - required for zenroom
Plug 'junegunn/goyo.vim'
" Works with goyo for the distraction-free writing in markdown
Plug 'amix/vim-zenroom2'
" Highlights current paragraph/snippet, I use with goyo for prose
Plug 'junegunn/limelight.vim'
" Customized vim startup screen
Plug 'mhinz/vim-startify'
" Rails highlighting etc
Plug 'tpope/vim-rails'
" Highlighting for styled-components which barely works and breaks jsx
" Plug 'styled-components/vim-styled-components', { 'branch': 'rewrite' }
" Better JSON support
Plug 'elzr/vim-json'
" Auto pair delimiters
Plug 'Raimondi/delimitMate'
" Make '.' be more better
Plug 'tpope/vim-repeat'
" Supposedly better CSS highlighting
Plug 'hail2u/vim-css3-syntax'
" CSS colors highlighted that very color
Plug 'ap/vim-css-color'
call plug#end()
" favorite colorscheme
colorscheme molokai
" for proper scrolling/mouse behavior
set mouse=a
" don't look at these filetypes
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.mov,*.pdf,*.psd,*.ai
" don't look at these filetypes either
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xls,*.xlsx
" be able to copy from neovim to clipboard on mac and ubuntu
set clipboard=unnamedplus
" reload buffer on changes
set autoread
" show regular line numbers and not that silly relative number shit
set number
" if your search contains uppercase, search for it like that
set smartcase
" if the search doesn't contain uppercase letter, ignore casing
set ignorecase
" don't show mode switching in the status bar
set noshowmode
" use spaces for tabs
set expandtab
" tab == 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
" indent by syntax
set smartindent
" indent automatically
set autoindent
" use those characters to show real tabs and trailing spaces
set listchars=tab:--,trail:·
" show the above chars
set list
" scroll offset to start scroll at the number of lines set
set scrolloff=8
" auto completion from spelling dictionary
set complete+=kspell
" dictionary location
set dictionary="/usr/dict/words"
" directory for temp files
set directory=~/.config/nvim/tmp//
" backup directory
set backupdir=~/.config/nvim/tmp/backup//
" record undos in corresponding files
set undofile
" undo files directory
set undodir=~/.config/nvim/tmp/undo//
" keep history of 500 undos
set history=500
" persistent undos
set undolevels=500
" max # of lines per undo on buffer reload
set undoreload=5000
"show the column line at col 80
set colorcolumn=80
" don't skip underscores in words
set iskeyword-=_
" code folding by indentation
set foldmethod=syntax
" fold at column-level
set foldcolumn=1
" open at 20 levels deep fold
set foldlevelstart=20
" fold colors
hi foldcolumn ctermbg=232
hi folded ctermbg=232
hi foldcolumn ctermfg=242
hi folded ctermfg=242
" hi Pmenu ctermfg=23 ctermbg=252
" hi PmenuSel ctermfg=123 ctermbg=242
"don't hide characters, like json quotes wtf
let g:vim_json_syntax_conceal = 0
" autocomplete relative paths from current buffer
let g:deoplete#file#enable_buffer_path = 1
"space is leader key
let mapleader = "\<Space>"
"faster normal mode from insert mode
inoremap jj <ESC>
" do the git dance
inoremap <leader>gs :Gstatus<CR>
"faster saving
nnoremap <leader>w :w<CR>
"jsx commenting
nnoremap <leader>jc i{/*<space>*/}<esc>hhi
"open NERDTree
map <C-o> :NERDTreeToggle %:p:h<CR>
"open Gundo
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
nnoremap <leader>u :GundoToggle<CR>
"tab with visual mode
vmap <Tab> >gv
"back tab with visual mode
vmap <S-Tab> <gv
"edit this file in a new window
nnoremap <leader>ev :vsp $MYVIMRC<CR>
"edit zshrc in a new window
nnoremap <leader>ez :vsp ~/.zshrc<CR>
"edit tmux.conf in a new window
nnoremap <leader>et :vsp ~/.tmux.conf<CR>
"fuzzy find file in project with FZF
nnoremap F :FZF<CR>
"search project for word under cursor with Ag
nnoremap <silent> <leader>f :Ag <C-R><C-W><CR>
"start Ag search
nnoremap <leader>ag :Ag<space>
" sorting selection shortcut
vnoremap <leader>abc :sort<CR>
"git status
nnoremap <leader>gs :Gstatus<CR>
"git commit
nnoremap <leader>gcm :Gcommit -m<space>
"moves line down in normal mode
nnoremap <C-j> :m .+1<CR>==
"moves line up in normal mode
nnoremap <C-k> :m .-2<CR>==
"moves cursor down line in insert mode "
inoremap <C-j> <Esc>:m .+1<CR>==gi
"moves cursor up line in insert mode "
inoremap <C-k> <Esc>:m .-2<CR>==gi
"moves selected block down line visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
"moves selected block up line visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
"distraction-free mode
nnoremap <silent> <leader>z :Goyo<CR>
"destroy/undo current insert operation with ctrl-c
inoremap <C-c> <C-c>u
"leave insert mode with ctrl-c
vnoremap <C-c> <Esc>
"use the startified screen on startup
autocmd User Startified setlocal cursorline
" close popup window when cursor leaves or leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"strip all trailing whitespace in file on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
"markdown spellcheck, wrap text, auto-correct words, and enable pencil
autocmd bufread,bufnewfile *.md,*.markdown inoremap . .<c-g>u
autocmd bufread,bufnewfile *.md,*.markdown inoremap ? ?<c-g>u
autocmd bufread,bufnewfile *.md,*.markdown inoremap ! !<c-g>u
autocmd bufread,bufnewfile *.md,*.markdown inoremap , ,<c-g>u
autocmd bufread,bufnewfile *.md,*.markdown setlocal spell
autocmd bufread,bufnewfile *.md,*.markdown setlocal wrap
autocmd bufread,bufnewfile *.md,*.markdown call litecorrect#init()
autocmd bufread,bufnewfile *.md,*.markdown call pencil#init({'wrap': 'soft'})
"enable deoplete for code completion
let g:deoplete#enable_at_startup = 1
" one space per level in NERDTree
let g:NERDSpaceDelims = 1
" ale settings for linting and statusline
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
" go to next lint error
nmap <silent> <leader>e <Plug>(ale_next_wrap)
"lightline settings for status bar
let g:tmuxline_powerline_separators = 0
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ],
      \  'right': [ [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'filetype' ],
      \             [ 'linter_warnings',
      \             'linter_errors',
      \              'linter_ok'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction
autocmd User ALELint call s:MaybeUpdateLightline()
" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
" key map to expand emmet completion
let g:user_emmet_expandabbr_key = '<c-y>'
"don't conceal any syntax in markdown
let g:vim_markdown_conceal = 0
"highlight frontmatter in markdown
let g:vim_markdown_frontmatter = 1
" don't take too long for tern js completion
let g:tern_request_timeout = 1
" show indents lined up
let g:indentLine_char = '┆'
" always show hidden files in nerdtree
let NERDTreeShowHidden = 1
" scroll through auto completions
let g:SuperTabDefaultCompletionType = "<c-n>"
" let .js files be seen as jsx
let g:jsx_ext_required = 0
" where to keep yankring history for copying
let g:yankring_history_dir = '~/.config/nvim/tmp/yank'
" let emmet Autocomplete jsx
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
" startify start screen config
let g:startify_change_to_dir = 0
let g:startify_custom_header =
        \ map(split(system('fortune -s | cowsay'), '\n'), '"   ". v:val') + ['']
"gist creation settings
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
" match open/closing things like parens and quotes and tags
runtime macros/matchit.vim
"distraction free mode limelight and goyo settings
function! s:goyo_enter()
  silent !tmux set status off
  Goyo 100x90%
  Limelight
endfun
function! s:goyo_leave()
  silent !tmux set status on
  Limelight!
endfun
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
"actual codefolding that doesn't suck
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
