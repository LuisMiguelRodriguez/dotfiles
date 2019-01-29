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

Plug 'valloric/youcompleteme', {'do': './install.py --tern-completer' }
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'

Plug 'vimwiki/vimwiki', { 'branch': 'dev'  }
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'Chiel92/vim-autoformat'
Plug 'gyim/vim-boxdraw'

call plug#end()
"End of vim-plug"

let g:formatterpath = ['/usr/lib/node_modules/js-beautify']
au BufWrite * :Autoformat

" mapping ctrl+n to open nerdtree
map <C-n> :NERDTreeToggle<CR>

" ctrl+s to save file
"map <C-s> :w<CR>
noremap <Esc><Esc> :w<CR>



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

"for emmet
let g:jsx_ext_required = 0
let g:user_emmet_leader_key='<Tab>'


" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying  ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0"
