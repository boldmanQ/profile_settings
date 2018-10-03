"VIM基本设置
set nocompatible    "关闭兼容VI，使用VIM扩展功能, 放在第一条
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1
""编码识别顺序
set smartindent     "自动缩进{}[]()等字符
"set autoindent      "与上一行保持相同缩进
set backspace=2

set expandtab   "输入tab时自动转换为空格
set tabstop=4   "设定文件中tab的宽度
set softtabstop=4   "设定编辑模式下tab的视在宽度
set shiftwidth=4    "表示缩进的宽度

set number      "显示行号
set hlsearch    "高亮搜索关键字
set encoding=utf8   "vim内部编码类型
set showmatch       "输入[})时显示匹配的]{(
set matchtime=2     "showmatch显示匹配情况的时间
set matchpairs+=<:>     "设置showmatch匹配的类型
set t_Co=256

colorscheme molokai
syntax enable

syntax on   "颜色区分关键字
nmap fsw :w<CR>
nmap fwq :wq<CR>
nmap fuq :q<CR>
""-------------------------------------------------------------------vundle配置开始
filetype off "必须
"设置包括vundle和初始化相关的runtime path
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
""让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'

"你的所有插件需要在下面这行之前
call vundle#end()   "必须
"
filetype plugin indent on "必须 加载vim自带和插件相应的语法和文件类型相关脚本
""--------------------------------------------------------------------vundle配置结束



"scrooloose/nerdtree 目录树
"":NERDTreeFromBookmark <bookmark>
nnoremap <F7> :NERDTreeToggle<CR>
inoremap <F7> <ESC>:NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree
let NERDTreeWinPos='left'
let NERDTreeShowBookmarks=1
let NERDChristmasTree=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeShowHidden=1
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif


"Lokaltog/vim-powerline
"let g:Powerline_symbols = 'fancy'
"


""Valloric/YouCompleteMe 代码补全
autocmd InsertLeave,CursorMovedI * if pumvisible() == 0|pclose|endif    "自动关闭弹出窗口
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_error_symbol = 'xx'
let g:ycm_warning_symbol = '!!'
let g:ycm_complete_in_strings = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_semantic_triggers =  {
            \       'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \       'html,htm' : ['.'],
            \   }

"syntastic语法检查
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--ignore=E501,E265"
