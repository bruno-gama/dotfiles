set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'chrisbra/color_highlight'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'valloric/youcompleteme'
Plugin 'elmcast/elm-vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'w0rp/ale'
Plugin 'reasonml-editor/vim-reason-plus'
Plugin 'tomtom/tcomment_vim'
Plugin 'christoomey/vim-system-copy'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'styled-components/vim-styled-components'
Plugin 'jparise/vim-graphql'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'janko/vim-test'
Plugin 'jxnblk/vim-mdx-js'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Put your non-Plugin stuff after this line


syntax enable
colorscheme palenight
hi Normal ctermbg=none
let g:colorizer_auto_filetype='css,html' "hex color strings highlighter

set mouse=a " use mouse

" change caret to cursor in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset cursor on start:
augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Netrw options
map <C-n> :Explore<CR>
let g:netrw_liststyle = 3

" CtrlP options
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " ignore files included in .gitignore

" ALE options
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'typescript': ['eslint', 'tslint'],
\  'json': ['eslint'],
\  'ruby': ['rubocop'],
\}

" ALE options
let g:ale_linters = {
\  'javascript': ['eslint', 'flow'],
\  'ruby': ['rubocop'],
\}

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters_explicit = 1

" YouCompleteMe options
let g:ycm_semantic_triggers = {
\  'elm' : ['.'],
\}

let g:ycm_show_diagnostics_ui = 0

" JSX in .js files
let g:jsx_ext_required = 0

" Ack options
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Vim-tmux-runner options
let g:VtrPrompt = '👉 '
let g:VtrOrientation = 'h'
let g:VtrPercentage = 40
nnoremap <Space>o :VtrOpenRunner<CR>
nnoremap <Space>x :VtrKillRunner<CR>
nnoremap <Space>r :VtrSendCommandToRunner<Space>

" Vim-test options
let test#strategy = 'vtr'
let test#enabled_runners = ['ruby#rspec', 'javascript#jest']
let test#javascript#jest#executable = 'yarn test'

nnoremap <Space>tn :TestNearest<CR>
nnoremap <Space>tf :TestFile<CR>
nnoremap <Space>ts :TestSuite<CR>
nnoremap <Space>tl :TestLast<CR>
nnoremap <Space>tg :TestVisit<CR>

" Following settings have been stolen from the CampusCode dotfiles
" (https://github.com/campuscode/cc_dotfiles/blob/master/vimrc')

let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " Swapfiles cause me more bad than good
set history=1000  " a lot of history
set ruler         " show the cursor position all the time
set hlsearch
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set ignorecase    " Ignore case when searching...
set smartcase     " ...unless we type a capital
set showmode      "Show current mode down the bottom
set visualbell    " No noise
set nowrap        "Don't wrap lines
set nomodeline    "Don't get hacked'
inoremap kj <Esc>
inoremap jk <Esc>
nnoremap <leader>l :ALELint<CR>
nnoremap <leader>p :ALEFix<CR>
nnoremap <leader>a :Ack!<Space>
nnoremap <Space>f :VtrSendCommandToRunner yarn flow<CR>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5
" Make easy to navigate
set relativenumber

" skip tmp files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.cache

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
