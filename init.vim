set nu " number 
set rnu " relativenumber 
set tabstop=4 " how many space to display a tab				 
set shiftwidth=4 " tab space in the line when is void 
set wildmode=list:longest " make wildmenu behave like similar to Bash completion 
set autoindent 
set nowrap " no wrapping lines 
set mouse=a " mouse support interaction 
set noshowmode 
syntax on 
set encoding=utf-8 " set encoding 
filetype plugin on
  
let mapleader = " " 
 
" TIPS 
" |____ paste from clipboard with "+p 
" |____ copy to clipboard with "+y 
 
"-------------------------- Required for coc --------------------------"
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience. and signify
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
" for nvim 0.5.0 -> set signcolumn=number
set signcolumn=yes
set shortmess+=c 
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"----------------------------------------------------------------------"

" plugins
source ~/.config/nvim/plugins.vim
" theme
source ~/.config/nvim/themes/gruvbox.vim

" Change to normal mode
inoremap jk <Esc>

" save file and exit file
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
" close the current buffer
nnoremap <leader>b :bd<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" TAB in general mode will move to next buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go to prev buffer
nnoremap <S-TAB> :bprevious<CR>

" DONT USE the arrow keys for moving in vim
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" nerdtree
nnoremap <leader>n :NERDTreeFind<cr>

" easymotion
nmap <leader>s <Plug>(easymotion-s2)
" fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>a :Ag<cr>

" execute
nnoremap <leader>x :!node %<cr>

" ----------------- plugin config
"  closetag
let g:closetag_filetypes = 'html, javascript, jsx, xml'
let g:closetag_emptyTags_caseSensitive = 1
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set splitright
" open terminal
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>
