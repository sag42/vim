execute pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=2
set expandtab

" Show relativ numbers.
set number relativenumber

" Colorscheme...
colorscheme industry

" Highlight search pattern.
set hlsearch

" Incremental search: Jump to match while typing.
set incsearch

" Show cursor line.
set cursorline

" Set <Leader> to <Space> 
:let mapleader=" "

" Relaod vimrc.
:nnoremap <Leader>r :so ~/.vimrc<CR>

" Jump to the beginning, end of the line.
:nnoremap <Leader>h 0
:nnoremap <Leader>l $

" Rust-specific: Jump to the previous function parameters. ?fn<CR> searches
" for fn, ww jumps to the parameters, :noh<CR> clears the search highlight.
" Only works if incsearch is activated.
:nnoremap <Leader>f ?fn <CR>ww:noh<CR>

" Change window.
:nnoremap <Leader>w <C-W><C-W>  

"Cycle through buffers with tab and shift-tab
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

"Cycle through windows using Ctrl-tab
"set autochdir
"map <C-Tab> <C-W>W:cd %:p:h<CR>:<CR>

if executable('rls')
  au User lsp_setup call lsp#register_server({
    \'name': 'rls',
    \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
    \ 'whitelist': ['rust'],
    \ })
endif

" enable signs
let g:lsp_signs_enabled = 1         

" enable echo under cursor when in normal mode
let g:lsp_diagnostics_echo_cursor = 0 

"Run :RustFmt on buffer save.
let g:rustfmt_autosave = 1

set hidden
let g:racer_cmd = "/home/sage/.cargo/bin/racer"

"autocomplete
let g:racer_experimental_completer = 1

"nerdtree
map <C-O> :NERDTreeToggle<Enter>

"status line
set laststatus=2

"tabs and windows
