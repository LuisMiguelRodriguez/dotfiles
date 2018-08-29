set number
set background=dark
colorscheme default
syntax on
set colorcolumn=100

set expandtab ts=4 sw=4 ai
set encoding=UTF-8


"-- AUTOCOMPLETION --
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

"colorscheme skittles_berry

"Start of vim-plug manager
 call plug#begin()

     Plug 'scrooloose/nerdtree'
     "Plug 'kien/ctrlp.vim'
     Plug 'jiangmiao/auto-pairs'
     Plug 'vim-airline/vim-airline'
    " Plug 'valloric/youcompleteme'
     Plug 'pangloss/vim-javascript'
     Plug 'nathanaelkane/vim-indent-guides'
     Plug 'ternjs/tern_for_vim'  
     Plug 'vimwiki/vimwiki', { 'branch': 'dev'  }

 call plug#end()
"End of vim-plug"

"colorscheme papaya

"Aliases section"

" mapping ctrl+n to open nerdtree
map <C-n> :NERDTreeToggle<CR>

" Toggle for Pasting
set pastetoggle=<F2>

let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_auto_colors = 0

hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

