" vimrc
" 
# Added to ~ by nkosetup.sh.
" Credit where credit is due:
" https://dougblack.io/words/a-good-vimrc.html
syntax enable		" enable syntax processing.
set tabstop=4		" number of visual spaces per tab. VISUAL ONLY.
set number		" show line numbers.
set cursorline		" underlines the current line.
filetype indent on	" treat indentation in file-type-specific way.
set wildmenu		" autocomplete commands show a visual menu.
set lazyredraw		" should do less redrawing, be faster.
set showmatch		" highlights encapsulation matches () {} []
set hlsearch		" highlight search hits.

" turn off search highlight upon hitting spacebar.
nnoremap <leader><space> :nohlsearch<CR>

