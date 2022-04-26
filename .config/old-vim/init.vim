call plug#begin()
Plug 'APZelos/blamer.nvim'            "in-line blamer
Plug 'airblade/vim-gitgutter'         "git diffs in the gutter
Plug 'ctrlpvim/ctrlp.vim'             "ctrl+p with ag searching
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'             "file tree utility
<<<<<<< HEAD:.config/nvim/init.vim
Plug 'tmsvg/pear-tree'                "bracket completion
=======
Plug 'ryanoasis/vim-devicons'
>>>>>>> chore: create base configs for lua:.config/nvim/old-vim/init.vim
Plug 'tpope/vim-surround'             "surround utils
Plug 'tpope/vim-commentary'           "comment utils
Plug 'w0rp/ale'                       "linting/format on save

" STYLE
Plug 'itchyny/lightline.vim'          "pretty bottom line
Plug 'gruvbox-community/gruvbox'      "theme
Plug 'mboughaba/i3config.vim'         "syntax highlighting for i3 config
Plug 'pangloss/vim-javascript'        "alternative js syntax highlighting
Plug 'vim-python/python-syntax'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'       "rust inlay hints

<<<<<<< HEAD:.config/nvim/old-vim/init.vim
<<<<<<< HEAD:.config/nvim/init.vim
"TELESCOPE:
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

=======
"STILL CONSIDERING:
=======
" STILL CONSIDERING
>>>>>>> wip: w0rp, and run formatter:.config/old-vim/init.vim
Plug 'tmsvg/pear-tree'               "bracket completion
>>>>>>> chore: create base configs for lua:.config/nvim/old-vim/init.vim
call plug#end()


"  set undodir=~/.vim/undodir "figure this mess out later
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
set number relativenumber
set shiftwidth=2
set splitright
set tabstop=2 softtabstop=2
set undofile


"LIGHTLINE
 set laststatus=2
 set noshowmode

"PRESERVIM
let g:NERDTreeShowHidden=1
let g:NERDTreeNatualSort=1 "Avoid weird sorting
let g:NERDCreateDefaultMappings=1

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif


" LINTING
let g:ale_fixers={
	\ 'c': ['clang-format'],
	\ 'javascript': ['eslint', 'prettier'],
	\ 'typescript': ['eslint', 'prettier'],
	\ 'python': ['autoflake', 'isort', 'black'],
	\ 'rust': ['rustfmt']
	\ }
let g:ale_fix_on_save=1


" GIT
let g:blamer_enabled=0
let g:blamer_show_in_insert_modes=0
let g:blamer_delay=1500


" TERMINAL
autocmd TermOpen * setlocal nonumber norelativenumber


" SEARCH
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


" GRUVBOX
let g:gruvbox_transparent_bg=1
let g:gruvbox_bold=0
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
let g:python_highlight_all = 1


" GITGUTTER
" set signcolumn=yes
highlight Normal guibg=NONE     ctermbg=NONE
highlight SignColumn		        ctermbg=None
highlight GitGutterAdd		      ctermbg=None ctermfg=Green
highlight GitGutterChange	      ctermbg=None ctermfg=Yellow
highlight GitGutterDelete	      ctermbg=None ctermfg=Red
highlight GitGutterChangeDelete ctermbg=None ctermfg=Cyan


" STRIP WHITESPACE ON SAVE
autocmd BufWritePre * :call StripTrailingWhitespaces()
function! StripTrailingWhitespaces()
    let _s=@/
    let l = line('.')
    let c = col('.')
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction


" MAP LEADER
nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>
let mapleader='\<space>' "this just works...
map <space> <leader>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Capital Y - behave like other capitals (C, D, etc.)
nnoremap Y y$

" Keep centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u


" QUIT:
nnoremap <leader>qa :quitall<CR>
nnoremap <leader>q1 :quitall!<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>


<<<<<<< HEAD:.config/nvim/old-vim/init.vim
"REPLACE ALL:
=======
" NERDTree:
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" REPLACE ALL
>>>>>>> wip: w0rp, and run formatter:.config/old-vim/init.vim
nnoremap <C-s> :%s/


" RESIZE
nnoremap <leader>l :5winc ><CR>
nnoremap <leader>k :5winc <<CR>


" COPY
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy


" PASTE
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


<<<<<<< HEAD:.config/nvim/old-vim/init.vim
"NAVIGATION:
=======
" NAVIGATION
>>>>>>> wip: w0rp, and run formatter:.config/old-vim/init.vim
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


<<<<<<< HEAD:.config/nvim/old-vim/init.vim
"NERDTree:
nnoremap <A-n> :NERDTreeFocus<CR>
nnoremap <A-r> :NERDTree<CR>
nnoremap <A-t> :NERDTreeToggle<CR>
nnoremap <A-f> :NERDTreeFind<CR>

=======
" LSP
set completeopt=menuone,noselect,noinsert

lua <<EOF
require('lsp')
EOF

" lua require'lspconfig'.eslint.setup({})
lua require'lspconfig'.clangd.setup({})
lua require'lspconfig'.html.setup({})
lua require'lspconfig'.pyright.setup({})
lua require'lspconfig'.rust_analyzer.setup({})
lua require'lspconfig'.tsserver.setup({})
lua require'lspconfig'.sumneko_lua.setup({})
>>>>>>> wip: w0rp, and run formatter:.config/old-vim/init.vim

"LSP:
set completeopt=menuone,noselect,noinsert
nnoremap <leader>fd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>


"CMP:
let g:completion_chain_complete_list = {
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['snippet', 'lsp', 'buffers']},
    \],
    \   },
    \}


"TELESCOPE:
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


lua <<EOF
require('config')
EOF
