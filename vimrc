set number
syntax on
"colorscheme molokai 
"colorscheme hybrid
colorscheme hybrid

" 解决插入模式下delete/backspce键失效问题
set nocompatible
set backspace=indent,eol,start

let mapleader=','
inoremap <leader>w <Esc>:w<cr>

inoremap jj <Esc>


" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

com! FormatJSON %!python3 -m json.tool



"========================vim-plug==========================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Initialize plugin system

" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" https://github.com/w0ng/vim-hybrid
Plug 'w0ng/vim-hybrid'
" https://github.com/tomasr/molokai
"Plug 'tomasr/molokai' 

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

Plug 'kien/ctrlp.vim'

Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'brooth/far.vim'

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

Plug 'majutsushi/tagbar'

Plug 'lfv89/vim-interestingwords'

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'deoplete-plugins/deoplete-jedi'

Plug  'sbdchd/neoformat'

Plug 'tpope/vim-commentary'
call plug#end()


" map keys for NerdTree Plugin
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
            \ '\.git$', '\.hg$', '\.svn$', '\.steversions$', '\.pyo$', '\.swp$',
            \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
            \]

" quick fuzzy serch
let g:ctrlp_map = '<c-p>'

" easy motion key map
nmap ss <Plug>(easymotion-s2)

" python-mode
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_doc=1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_options_max_line_length = 120


" ctrlp, 在~/.agignore添加一行node_modules
" https://stackoverflow.com/questions/24479101/vim-ctrlp-not-parsing-ag-silver-search-ignore-option-correctly
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$',
  \ }
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

let g:deoplete#enable_at_startup = 1
set completeopt-=preview
