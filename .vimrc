set nocompatible              " be iMproved, required
 filetype off                  " required

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
"------------------------------------------------------------------------------------------
"all plugins insatlled
"------------------------------------------------------------------------------------------
 Plugin 'VundleVim/Vundle.vim'
 "Plugin 'Valloric/YouCompleteMe'
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
"--------------------------------------------------------------------------------------------
"youcompleteme config
"--------------------------------------------------------------------------------------------
 let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
 let g:ycm_key_invoke_completion = '<C-Tab>'
 let g:ycm_key_list_select_completion = ['<Down>']
 let g:ycm_key_list_previous_completion = ['<Up>']
 let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
 let g:ycm_confirm_extra_conf=0
 let g:ycm_collect_identifiers_from_tags_files=1
 let g:ycm_min_num_of_chars_for_completion=2
 let g:ycm_cache_omnifunc=0	
 let g:ycm_seed_identifiers_with_syntax=1
 let g:ycm_complete_in_comments = 1
 let g:ycm_complete_in_strings = 1
 let g:ycm_collect_identifiers_from_comments_and_strings = 0

 nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
 nnoremap <leader>lo :lopen<CR>	
 nnoremap <leader>lc :lclose<CR>
 inoremap <leader><leader> <C-x><C-o>
 inoremap <expr> <CR>         pumvisible()? "\<C-y>" : "\<CR>"
 inoremap <expr> <Down>     pumvisible()? "\<C-n>":"\<Down>"
 inoremap <expr> <Up>       pumvisible()? "\<C-p>":"\<Up>"
 inoremap <expr> <PageDown>   pumvisible() ? '<PageDown><C-p><C-n>' : '<PageDown>'
 inoremap <expr> <PageUp>     pumvisible() ? '<PageUp><C-p><C-n>' : '<PageUp>'
 nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
 set autoindent
 set shiftwidth=4
 set tabstop=4 
 set softtabstop=4  
 set noexpandtab   
 set cindent
 set autoread 
 set autowrite 
 set ignorecase 
 set showmatch 
 set guioptions-=T
 set guioptions-=m
 ""set mouse=
 set hlsearch 
 set incsearch 
 set go-=T
 set completeopt=menu
 colorscheme monokai
 "inoremap { {<CR>}<ESC>O
 inoremap ' ''<ESC>i
 inoremap " ""<ESC>i
 inoremap ( ()<ESC>i
 inoremap } <C-r>=ClosePair('}')<CR>
 inoremap [ []<ESC>i
 inoremap ] <C-r>=ClosePair(']')<CR>
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
"Function
"------------------------------------------------------------------------------------------
"
"-1-
 function! ClosePair(char)
	if getline('.')[col('.')-1] == a:char
		return "\<Right>"
	else 
		return a:char 
	endif 
 endfunction 
