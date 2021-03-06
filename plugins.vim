call plug#begin('~/.vim/plugged')

" syntax support
Plug 'sheerun/vim-polyglot'
" icons
Plug 'ryanoasis/vim-devicons'

" auto close () [] , etc
Plug 'jiangmiao/auto-pairs'
" for </>
Plug 'alvan/vim-closetag'
" surround
Plug 'tpope/vim-surround'

" multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" intelissense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" emmet
Plug 'mattn/emmet-vim'

" nerdtree
Plug 'preservim/nerdtree'
" airline
Plug 'vim-airline/vim-airline'
"easymotion
Plug 'easymotion/vim-easymotion'

" commentaries
Plug 'preservim/nerdcommenter'

" search files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" show a diff 
Plug 'mhinz/vim-signify'

" themes 
Plug 'joshdick/onedark.vim' 
Plug 'morhetz/gruvbox'

" terminal
Plug 'voldikss/vim-floaterm'

call plug#end()
