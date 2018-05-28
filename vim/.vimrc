execute pathogen#infect()

set nocompatible  			" This must be first, because it changes other options as side effect
filetype on             " vim can detect the type of file that is edited.  This is done by checking the file name and sometimes by inspecting the contents of the file for specific text.
syntax enable           " syntax highlighting enables Vim to show parts of the text in another font or color
filetype indent on      " load filetype-specific indent files

set nowrap             	" don't wrap lines
set tabstop=2          	" a tab is two spaces
set copyindent    			" copy the previous indentation on autoindenting
set smartindent         " Do smart autoindenting when starting a new line
set autoindent				  " does nothing more than copy the indentation from the previous line
set shiftwidth=2        " number of spaces to use for autoindenting
set cursorline          " highlight current line
set expandtab           " tabs are spaces

let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
set guifont=hack:h14

let mapleader=" "

" Reload Vim Config Without Having To Restart Editor
map <leader>s :source ~/.vimrc<CR>

set hidden   						" It hides buffers instead of closing them. This means that you can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first. Also, undo buffers and marks are preserved while the buffer is open.
set hlsearch    				" highlight found words
set incsearch     			" search as characters are entered
set ignorecase    			" ignore case when searching
set showmatch     			" When selecting a parenthesis it will highlight the one matching:
set wildmenu      			" visual autocomplete for command menu
set visualbell    			" Use a visual bell instead of beeping
set ruler         			" Show the line and column number of the cursor position
set colorcolumn=120     " Add vertical color column
set laststatus=2        " always show status line
set number							" Show line number
set history=1000        " remember more commands and search history
set undolevels=1000     " use many muchos levels of undo

" Set F3 to enable/disable hlsearch
nnoremap <F3> :set hlsearch!<CR>

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

autocmd BufWritePre * :%s/\s\+$//e " remove whitespaces on save.

" I prefer using arrow keys instead of the default Vim mapping
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

" Toggle display of the tree with <Leader> + n
nmap <leader>n :NERDTreeToggle<CR>

" Locate the focused file in the tree with <Leader> + j
nmap <leader>j :NERDTreeFind<CR>

" Always open the tree when booting Vim, but don’t focus it
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Do not display some useless files in the tree
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

" Exclude files and directories using Vim's wildignore and CtrlP's own
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Search in tags
nnoremap <leader>. :CtrlPTag<cr>
