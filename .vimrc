
"Plugins
""" {{{
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-startify'
Plug 'bagrat/vim-buffet'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/indentpython.vim'
Plug 'mcchrish/nnn.vim'
Plug 'wellle/targets.vim'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'davidhalter/jedi-vim'
Plug 'vim-syntastic/syntastic'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'ap/vim-buftabline'
Plug 'aaronjensen/vim-sass-status'
call plug#end()
"PlugEnd }}}

"Basic Settings
"{{{
colorscheme gruvbox
set foldmethod=marker
set foldmarker={{{,}}}
set background=dark    " Setting dark mode
set noshowmode
set encoding=UTF-8
set showcmd
set number relativenumber
set nu rnu " turn hybrid line number
set mousehide
set wildmenu
set autoread
set nobackup
set nowritebackup
set noswapfile
set noerrorbells
set visualbell
set history=1000
set backspace=2
set hidden
set guifont=Menlo\ for\ Powerline:h12
"}}}

"Keymap
"{{{
nnoremap <leader><space> :noh<CR>
highlight link GitGutterChangeLine DiffText
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

"leader ,
let mapleader=","

" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>
nmap <silent> ,u~ :t.\|s/./\\~/g\|:nohls<cr>

"Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"fzf keys
"Buffers list
nmap ; :Buffers<CR>
"Files ,t
nmap <Leader>t :Files<CR>
"tags ,r
nmap <Leader>r :Tags<CR>

"Keys
map <C-o> :NERDTreeToggle<CR>

"Easemotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"}}}

"Plugins Settings
"{{{
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#ale#enabled = 1

" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" adding to vim-startify screen
let g:webdevicons_enable_startify = 1

" StatusBar
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
 \ 'colorscheme': 'wombat',
 \ 'active': {
 \   'left': [ [ 'mode', 'paste' ],
 \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
 \ },
 \ 'component_function': {
 \   'gitbranch': 'gitbranch#name',
 \   'sass-status': 'sass-status'
 \ },
 \ }

"FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }


let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

"GitGutter
let g:gitgutter_max_signs=1500
let g:gitgutter_realtime=1
let g:gitgutter_eager=1 
set updatetime=250

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Emmet
let g:user_emmet_leader_key=','

"font
let g:main_font = "Fira\\ Code\\ Retina:h10"

"autoclose
source ~/.vim/config/autoclosing.vim

"nnn
"" Disable default mappings
let g:nnn#set_default_mappings = 0
nnoremap <silent> <leader>nn :NnnPicker<CR>
nnoremap <leader>n :NnnPicker '%:p:h'<CR>
let g:nnn#layout = { 'left': '~20%' }

"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" incsearch.vim x fuzzy x vim-easymotion
" space + / 
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


"Autocomplite
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_shell_checkers = ['shellcheck']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_javascript_checkers = [ 'eslint' ]
let g:syntastic_javascript_eslint_exec = 'eslint_d'
"}}}