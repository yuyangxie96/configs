set term=screen-256color
set mouse=a

" 自动安装 vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --insecure --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug 插件列表
call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'

" 基本设置
Plug 'tpope/vim-sensible'

" 状态栏
Plug 'Lokaltog/vim-powerline', {'branch': 'develop'}

" C++ 语法高亮
Plug 'octol/vim-cpp-enhanced-highlight'

" 显示缩进
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'thaerkh/vim-indentguides'

" 切换头/源文件
Plug 'lljbash/vim-fswitch'

" 打标签：mx  跳转：'x  最后一次更改：'.  来回跳：''
Plug 'kshenoy/vim-signature'

" C++ 文件大纲  依赖 ctags
Plug 'majutsushi/tagbar'

" 全局搜索
"Plug 'dyng/ctrlsf.vim'

" 多光标，选中任意文本后，使用 <C-n> 和 <C-p> 找到下一个匹配的字符
Plug 'terryma/vim-multiple-cursors'

" <Leader>cc 加注释; <Leader>cu 解注释; <Leader>c<space> 切注释; <Leader>cy 复制+注释
Plug 'scrooloose/nerdcommenter'

" 用 tab 进行所有类型的补全
"Plug 'ervandew/supertab'

" 各种 snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" <Leader>PP 由 C++ 接口快速生成实现框架，
"Plug 'derekwyatt/vim-protodef'
Plug 'Pomakhin/vim-protodef-custom'

" 文件树
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" 多标签管理
"Plug 'fholgado/minibufexpl.vim'

" 智能范围选择
Plug 'gcmt/wildfire.vim'

" <Leader><Leader> 开头的快速跳转
Plug 'Lokaltog/vim-easymotion'

" 括号自动补全
"Plug 'Raimondi/delimitMate'
"Plug 'jiangmiao/auto-pairs'
" now using coc-pairs

" 括号环绕、编辑、取消
Plug 'tpope/vim-surround'

" 自动补全框架，需要 node, 用 CocInstall 安装插件
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 搜索时大小写不敏感
"set ignorecase
" 关闭兼容模式
set nocompatible

" 配色方案
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 设置 gvim 显示字体
"set guifont=YaHei\ Consolas\ Hybrid\ 11.5

" 禁止折行
"set nowrap

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
set cino+=g0
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 切换粘贴模式
set pastetoggle=<F9>
" 禁止系统剪贴板
"set clipboard=exclude:.*

" 禁止鼠标中键功能
map <MiddleMouse> <Nop>
map! <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
map! <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map! <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
map! <4-MiddleMouse> <Nop>

" 设置状态栏
let g:Powerline_colorscheme='solarized256'

"" C++ 高亮设置
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

"" 显示缩进设置
" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
" 色块宽度
"let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'

"" *.cpp 和 *.h 间切换
nnoremap <silent> <Leader>sw :FSHere<cr>

"" tagbar 设置
nnoremap <Leader>t :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

"" ycm 设置
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_show_diagnostics_ui = 1
"let g:ycm_server_log_level = 'info'
"let g:ycm_min_num_of_chars_for_completion = 2
"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 1
"set completeopt=menu,menuone
"let g:ycm_key_list_select_completion = ['<C-n>']
"let g:ycm_key_list_previous_completion = ['<C-p>']
"let g:ycm_key_list_stop_completion = ['<C-y>', '<UP>', '<DOWN>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:EclimCompletionMethod = 'omnifunc'
"nnoremap <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <Leader>f :YcmCompleter FixIt<CR>
"let g:ycm_semantic_triggers =  {
"            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"            \ 'cs,lua,javascript': ['re!\w{2}'],
"            \ }

"" 文件树设置
" <Leader>N 打开/关闭
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1

