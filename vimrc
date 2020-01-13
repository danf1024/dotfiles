set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'w0rp/ale'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-endwise'
Plugin 'evansalter/vim-checklist'
Plugin 'rust-lang/rust.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jason0x43/vim-js-indent'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'Quramy/tsuquyomi'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>
nmap \e :NERDTreeToggle<CR>
nmap \t :Files<CR>
nmap \r :Tags<CR>
nmap \x :ChecklistToggleCheckbox<CR>
nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" trip trailing whitespace EXCEPT for markdown files
fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType markdown let b:noStripWhitespace=1
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.js,*.scss,*.jl,*.py set shiftwidth=4 | set softtabstop=4
autocmd BufNewFile,BufRead *.md setlocal textwidth=80

let g:ale_ruby_rubocop_executable = 'rubocop-daemon-wrapper'

let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\}

let g:ale_fix_on_save = 1

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color "always"
  \ -g "*.{ts,tsx,hbs,sql,R,rs,java,groovy,jbuilder,js,jsx,json,php,ctp,css,scss,md,styl,jade,html,config,py,cpp,c,go,hs,rb,erb,conf,xml,lock,jl,yml,yaml}" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

let ruby_no_expensive=1

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" OPTIONS
set re=1
set ai
set autoread
set autowrite
set backspace=indent,eol,start
set directory-=.
set encoding=utf8
set fileformats=unix,dos,mac
set history=200
set ignorecase
set incsearch
set infercase
set laststatus=2
set linebreak
set number

set expandtab
set shiftwidth=2
set softtabstop=2

set timeoutlen=1000
set ttimeoutlen=0

