call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
call plug#end()

nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>

augroup nerdtree_open
	autocmd!
	autocmd VimEnter * NERDTree | wincmd p
augroup END
