 set nocompatible              " be iMproved, required
 set backspace=indent,eol,start
 filetype off                  " required

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
"------------------------------------------------------------------------------------------
"all plugins installed
"------------------------------------------------------------------------------------------
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'majutsushi/tagbar'
 Plugin 'tpope/vim-fugitive'
 Plugin 'scrooloose/nerdtree'
 Plugin 'kien/ctrlp.vim'
 Plugin 'msanders/snipmate.vim'
 Plugin 'mileszs/ack.vim'
 Plugin 'Lokaltog/vim-easymotion'
 Plugin 'Lokaltog/vim-powerline'
 Plugin 'dgryski/vim-godef'
 Plugin 'fatih/vim-go'
 Plugin 'bling/vim-airline'
 Plugin 'davidhalter/jedi-vim'
 Plugin 'iamcco/mathjax-support-for-mkdp'
 Plugin 'iamcco/markdown-preview.vim'
"--------------------------------------------------------------------------------------------

 call vundle#end()            " required
 filetype plugin indent on    " required

"--------------------------------------------------------------------------------------------
"nerdtree config
"--------------------------------------------------------------------------------------------
 let mapleader=","
 map <F4> :NERDTreeToggle<CR>
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
 let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
 let NERDTreeMinimalUI=1
"

"-------------------------------------------------------------------------------------------
"vim-go key map
"-------------------------------------------------------------------------------------------
 nnoremap <leader>b :GoBuild<CR>
 nnoremap <leader>r :GoRun<CR>
 nnoremap <leader>t :GoTest<CR>
 nnoremap <leader>f :GOTestFunc<CR>
"
"--------------------------------------------------------------------------------------------
"basic config for edit, like syntax, shiftwidth, tab
"--------------------------------------------------------------------------------------------
 syntax enable
 syntax on
 set completeopt=longest,menu
 set completeopt-=preview
 set ruler
 set showcmd
 set number
 set novisualbell
"" set autoindent
 set shiftwidth=4
 set tabstop=4
 set softtabstop=4
 set noexpandtab
"set cindent
 set autoread
 set autowrite
 set ignorecase
 set showmatch
 set guioptions-=T
 set guioptions-=m
 set mouse=a
 set hlsearch
 set incsearch
 set go-=T
 set completeopt=menu
 colorscheme monokai
 "inoremap { {<CR>}<ESC>O
 ""inoremap ' ''<ESC>i
 ""inoremap " ""<ESC>i
 ""inoremap ( ()<ESC>i
 ""inoremap } <C-r>=ClosePair('}')<CR>
 ""inoremap [ []<ESC>i
 ""inoremap ] <C-r>=ClosePair(']')<CR>
 nnoremap <C-l> gt
 nnoremap <C-h> gT
 nnoremap <leader>w   :w<CR>i
 nnoremap <leader>wq  <ESC>:wq<CR>
 nnoremap <leader>q   :q!<CR>
 nnoremap <Space>j <C-W><C-J>
 nnoremap <Space>k <C-W><C-K>
 nnoremap <Space>l <C-W><C-L>
 nnoremap <Space>h <C-W><C-H>
 nnoremap <leader>cd :NERDTree<Space>
 if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
 endif

 nnoremap <M-d> <C-d>
 nnoremap <M-u> <C-u>
"
"-------------------------------------------------------------------------------------------
"go language related config
"-------------------------------------------------------------------------------------------
 let g:go_disable_autoinstall = 0
 let g:go_highlight_functions = 1
 let g:go_highlight_methods = 1
 let g:go_highlight_structs = 1
 let g:go_highlight_operators = 1
 let g:go_highlight_build_constraints = 1
 let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}
"
"-------------------------------------------------------------------------------------------
"tagbar config
"need install:
"go get -u github.com/jstemmer/gotags
"sudo apt-get install ctags
"-------------------------------------------------------------------------------------------
 let g:tagbar_width=35
 let g:tagbar_autofocus=1
 nmap <F6> :TagbarToggle<CR>
"
"------------------------------------------------------------------------------------------
"ack config
"need install:
"apt-get install ack-grep
"------------------------------------------------------------------------------------------
 nnoremap <F3> :Ack<Space>
"
"------------------------------------------------------------------------------------------
 let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
 map <Leader>h <Plug>(easymotion-linebackward)
 map <Leader>j <Plug>(easymotion-j)
 map <Leader>k <Plug>(easymotion-k)
 map <Leader>l <Plug>(easymotion-lineforward)

 "
"------------------------------------------------------------------------------------------
" MarkdownPreview
"------------------------------------------------------------------------------------------
nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview

"
"
let g:pymode_python = 'python3'
"------------------------------------------------------------------------------------------
"Function
"------------------------------------------------------------------------------------------
"
"-1-
"" function! ClosePair(char)
""	if getline('.')[col('.')-1] == a:char
""		return "\<Right>"
""	else
""		return a:char
""	endif
"" endfunction
