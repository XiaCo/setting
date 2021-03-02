" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" golang plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" 结构体折叠
"Plug 'AndrewRadev/splitjoin.vim'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
"Plug 'jiangmiao/auto-pairs'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree'  " 树形目录
" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'
" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'
" 使nerdtree根据规则寻找根目录
Plug 'airblade/vim-rooter'

" 代码块生成
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 更强大的 tab 补全，使YCM与ultisnips tab兼容
"Plug 'vim-scripts/SuperTab'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

" json
Plug 'axiaoxin/vim-json-line-format'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'yggdroot/indentline'  " python 对其线
Plug 'easymotion/vim-easymotion'  " 跳转
"set completeopt=longest,menuone  " 关闭函数详情

" 有道词典在线翻译
"Plug 'ianva/vim-youdao-translater'

" 配色方案
Plug 'w0ng/vim-hybrid'
" colorscheme neodark
Plug 'KeitaNakamura/neodark.vim'
" colorscheme monokai
Plug 'crusoexia/vim-monokai'
" colorscheme github 
Plug 'acarapetis/vim-colors-github'
" colorscheme one 
Plug 'rakr/vim-one'

call plug#end()

" 开启24bit的颜色，开启这个颜色会更漂亮一些
set termguicolors
" 配色方案, 可以从上面插件安装中的选择一个使用
colorscheme one " 主题
set background=dark " 主题背景 dark-深色; light-浅色

" 保存自动运行:goimports
let g:go_fmt_command = "goimports"

let g:go_version_warning = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
                       
" YCM
"set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" 自定义代码块文件位置
let g:UltiSnipsSnippetDirectories=[$HOME.'.vim/mysnippets']

" root位置匹配
let g:rooter_patterns = ['.git', 'main.go']

" 自动打开markdown视窗
" let g:mkdp_auto_start= 1
" 禁用markdown折叠
autocmd BufNewFile,BufRead *.md set nofoldenable


syntax on    "语法高亮
set nu
set ic  "匹配忽略大小写
set cursorline "突出显示当前行
set nowrap    "不自动折行
"set foldmethod=indent
"set nofoldenable " 关闭折叠
set showmatch    "显示匹配的括号
set scrolloff=3        "距离顶部和底部3行"
set encoding=utf-8  "编码
set fenc=utf-8      "编码
set hlsearch        "搜索高亮
set tabstop=4   "tab宽度
set expandtab       "tab替换为空格键
set autoindent      "自动缩进


" n(普通),v(可视),i(插入),c(命令行)

let mapleader=" "

noremap <C-a> ggVG
inoremap <C-.> .<C-x><C-o>

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
vmap <Leader>c "+yy
" n 模式下复制一行到系统剪切板
nmap <Leader>c "+yy
" n 模式下粘贴系统剪切板的内容
nmap <Leader>v "+p

" 命令行模式下
cnoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" 插入模式上下左右
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" 切换视窗
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-w> <C-w>c

" 页面搜索
nmap ss <Plug>(easymotion-s2)

" vim-go debug
nnoremap <leader>r :GoRun<CR>
nnoremap <leader>d :GoDebugStart<CR>
nnoremap <leader>t :GoDebugContinue<CR>
nnoremap <leader>n :GoDebugNext<CR>
nnoremap <leader>i :GoDebugStep<CR>
nnoremap <leader>o :GoDebugStepOut<CR>
nnoremap <leader>p :GoDebugBreakpoint<CR>
nnoremap <leader>q :GoDebugStop<CR>
nnoremap <leader>im :GoImplements<CR>
nnoremap <leader>re :GoReferrers<CR>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nmap tree :NERDTreeToggle<CR>
nnoremap <leader>ts :NERDTreeClose<CR>
" 显示行号
let NERDTreeShowLineNumbers=1

" :command
" 以下两个命令效果一致，功能为去除双引号转义并json格式化，演示说明了不通模式下<CR>失效(需要用|代替)以及转义问题
com! JsonFormat :s/\\\|^"\|"$//g | :%!jsonf -c=false -s=false
"nmap jsont :s/\\\\|^"\\|"$//g<CR>:%!python -m json.tool<CR>

" \n\t进行换行
com! Printn :%s/\\n\\t/\r/g

com! Json :%!jsonf -c=false -s=false
"此命令注释掉原因是：在normal模式下移动变卡顿
"nmap json :%!python -m json.tool


" 自动运行
" 关闭文件自动关闭nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 字体
set guifont=Monaco:h14
" macvim启动目录
":cd ~/Desktop/gowork


