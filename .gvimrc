" ================================
" Lightline settings
" ================================

let g:lightline = {
   \    "colorscheme": "wombat",
   \    "active": {
   \        "left": [
   \            ["mode", "paste"],
   \            ["readonly", "filename", "fugitive", "modified"]
   \        ]
   \    },
   \    "component": {
   \        'readonly': '%{&filetype=="help"?"":&readonly?"?":""}',
   \        'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
   \        'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
   \    },
   \    'component_visible_condition': {
   \        'readonly': '(&filetype!="help"&& &readonly)',
   \        'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
   \        'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
   \    }
   \}
let g:neosnippet#snippets_directory='~/.vim/snippets/'

" ================================
" General settings
" ================================
"
syntax on

" Set variables
set number
set autoindent
set nowrap
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256
set background=dark
set renderoptions=type:directx,renmode:5
set guifont=Hasklig:h13,
set guifontwide=MS_Gothic:h13
set laststatus=2
set fileformats=unix,dos,mac
set ambiwidth=double
set guioptions+=a

" Encodings - shift_jis(win)
set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set nocompatible

" Theme
colorscheme lucario
"colorscheme solarized

autocmd GUIEnter * set transparency=250
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE
" highlight SpecialKey ctermbg=NONE guibg=NONE
" highlight EndOfBuffer ctermbg=NONE guibg=NONE
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b


" Another - highlight ZenkakuSpace
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /?@/
