call plug#begin()
Plug 'APZelos/blamer.nvim'       "blamer in the gutter
Plug 'airblade/vim-gitgutter'    "git diffs on the side
Plug 'ctrlpvim/ctrlp.vim'        "ctrl+p with ag searching
Plug 'itchyny/lightline.vim'     "pretty bottom line
Plug 'mboughaba/i3config.vim'    "syntax highlighting for i3 config
Plug 'gruvbox-community/gruvbox' "theme
Plug 'pangloss/vim-javascript'   "alternative js syntax highlighting
Plug 'preservim/nerdcommenter'   "space+C line commenting... ok.
Plug 'preservim/nerdtree'        "file tree left side
Plug 'tmsvg/pear-tree'           "bracket completion
Plug 'w0rp/ale'                  "linting/format on save

"LSP:
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

"Still Considering These:
"Plug 'jelera/vim-javascript-syntax'  "alternative js syntax highlighting 2
"Plug 'sainnhe/sonokai'               "old theme used in vs code
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()


"TODO: LSP/(deloplete/omnifunc + ale) toggle?


"set undodir=~/.vim/undodir "figure this mess out later
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set clipboard+=unnamedplus
set cursorline
set incsearch
set mouse=a
set nobackup
set noerrorbells
set noswapfile
set nowrap
set number relativenumber "display current line as actual line number
set shiftwidth=2
set splitright "NERDtree open split on right side
set tabstop=2 softtabstop=2
set undofile


"LIGHTLINE:
set laststatus=2
set noshowmode


"PRESERVIM:
let g:NERDTreeShowHidden=1 "Show hidden files
let g:NERDTreeNatualSort=1 "Avoid weird sorting
let g:NERDCreateDefaultMappings=1

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif


"LINTING:
let g:ale_fixers={
	\ 'javascript': ['eslint'],
	\ 'typescript': ['eslint'],
	\ 'rust': ['rustfmt']
	\ }
let g:ale_fix_on_save=1


"GIT:
let g:blamer_enabled=0
let g:blamer_show_in_insert_modes = 0
let g:blamer_delay=3000


"TERMINAL:
autocmd TermOpen * setlocal nonumber norelativenumber


"SEARCH:
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching=0
endif

let g:ctrlp_show_hidden=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_custom_ignore={
  \ 'dir':  '\.git$\|node_modules\|tmp\|bower_components\|pdfjs\|out$',
  \ 'file': '\.so$\|\.swp|\.dat$|\.DS_Store$'
  \ }


"GRUVBOX:
let g:gruvbox_transparent_bg=1
autocmd VimEnter * hi Normal ctermbg=none
colorscheme gruvbox


"MAP LEADER:
nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>
let mapleader='\<space>' "this just works...
map <space> <leader>


"VIM IS ACTUALLY TERRIBLE:

" Capital Y - behave like other capitals (C, D, etc.)
nnoremap Y y$

" Keep centered when nexting, unfold line.
" TODO: Learn how to use folds, lol
nnoremap n nzzzv
nnoremap N Nzzzv

" Combine line, stay centered.
nnoremap J mzJ`z

"Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u


"GENERAL:
nnoremap <leader>qa :quitall<CR>
nnoremap <leader>q1 :quitall!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>


"NERDTree:
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


"REPLACE ALL:
nnoremap <C-s> :%s/


"RESIZE:
nnoremap <leader>l :5winc ><CR>
nnoremap <leader>k :5winc <<CR>


"COPY:
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy


"PASTE:
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


"STRIP WHITESPACE ON SAVE:
autocmd BufWritePre * :call StripTrailingWhitespaces()
function! StripTrailingWhitespaces()
    let _s=@/
    let l = line('.')
    let c = col('.')
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction


"LSP:
set completeopt=menu,menuone,noselect

"lua require'lspconfig'.eslint.setup({})
lua require'lspconfig'.pyright.setup({})
lua require'lspconfig'.rust_analyzer.setup({})
lua require'lspconfig'.tsserver.setup({})
lua require'lspconfig'.sumneko_lua.setup({})

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>rn: :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>

lua <<EOF
require('lsp')
EOF

let g:completion_chain_complete_list = {
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['snippet', 'lsp', 'buffers']},
    \],
    \   },
    \}
